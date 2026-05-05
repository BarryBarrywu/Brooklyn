//
//  LoopPlayer.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 23/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import AVFoundation

// MARK: - LoopPlayer
final class LoopPlayer: AVQueuePlayer {

    // Tracks ObjectIdentifiers of items that belong to this player instance,
    // so we can filter out AVPlayerItemDidPlayToEndTime notifications from other
    // LoopPlayer instances (e.g. screensaver preview + main display, multi-monitor).
    private var managedItemIDs: Set<ObjectIdentifier> = []

    // MARK: Lifecycle
    init(items: [Animation], numberOfLoops: Int, shouldRandomize: Bool) {
        let items = (shouldRandomize ? items.shuffled() : items)
            .reduce(into: [AVPlayerItem]()) {
                guard let item = AVPlayerItem(video: $1, extension: .mp4, for: LoopPlayer.self) else { return }
                $0.append(contentsOf: Array(copy: item, count: numberOfLoops))
            }
            .prepareForQueue()

        super.init(items: items)
        items.forEach { managedItemIDs.insert(ObjectIdentifier($0)) }
        observe()
    }

    override init() {
        super.init()
    }


    deinit {
        unobserve()
    }
}

// MARK: - Actions
extension LoopPlayer {
    
    func play(_ animation: Animation) {
        guard let item = AVPlayerItem(video: animation, extension: .mp4, for: LoopPlayer.self) else { return }
        actionAtItemEnd = .none
        managedItemIDs.removeAll()
        removeAllItems()
        let prepared = [item].prepareForQueue()
        prepared.forEach {
            managedItemIDs.insert(ObjectIdentifier($0))
            insert($0, after: items().last)
        }
        actionAtItemEnd = .advance
    }
}

// MARK: - Observers
private extension LoopPlayer {
    
    func observe() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidFinish),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: nil)
    }
    
    func unobserve() {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                  object: nil)
    }
    
    @objc
    func playerItemDidFinish(_ notification: Notification) {
        guard let finishedItem = notification.object as? AVPlayerItem,
              managedItemIDs.contains(ObjectIdentifier(finishedItem)) else { return }
        managedItemIDs.remove(ObjectIdentifier(finishedItem))
        guard let itemCopy = currentItem?.copy() as? AVPlayerItem else { return }
        managedItemIDs.insert(ObjectIdentifier(itemCopy))
        insert(itemCopy, after: items().last)
    }
}

// MARK: - AVPlayerItems' Utils
fileprivate extension Array where Element: AVPlayerItem {
    
    func prepareForQueue() -> [AVPlayerItem] {
        if count == 1, let itemCopy = first?.copy() as? AVPlayerItem {
            return self + [itemCopy]
        }
        
        return self
    }
    
    init(copy item: Element, count: Int) {
        let elements = [Int](0...count).compactMap { _ in return item.copy() as? Element }
        self.init(elements)
    }
}
