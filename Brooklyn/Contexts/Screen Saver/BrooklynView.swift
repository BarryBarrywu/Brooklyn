//
//  BrooklynView.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 30/10/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation
import ScreenSaver
import AVKit

// MARK: - BrooklynView
final class BrooklynView: ScreenSaverView {

    // MARK: Local Typealias
    typealias Static = BrooklynView
    
    // MARK: Constant
    private enum Constant {
        static let backgroundColor = NSColor(red: 0.00, green: 0.01, blue: 0.00, alpha:1.0)
    }
    
    // MARK: Outlets
    private let videoLayer = AVPlayerLayer()
    
    // MARK: Properties
    private let manager = BrooklynManager(mode: .screensaver)
    private lazy var preferences = PreferencesWindowController(windowNibName: PreferencesWindowController.identifier)

    // MARK: Initialization
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        configure()
    }

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        configure()
    }

}

// MARK: - Lifecycle
extension BrooklynView {

    override func startAnimation() {
        super.startAnimation()
        syncVideoLayerFrame()
        manager.player.play()
    }

    override func stopAnimation() {
        super.stopAnimation()
        manager.player.pause()
    }
}

// MARK: - Layout
extension BrooklynView {

    override func layout() {
        super.layout()
        if videoLayer.superlayer == nil {
            layer?.addSublayer(videoLayer)
        }
        syncVideoLayerFrame()
    }

    private func syncVideoLayerFrame() {
        guard bounds.width > 0, bounds.height > 0 else { return }
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        videoLayer.frame = bounds
        CATransaction.commit()
    }
}

// MARK: - Configuration
private extension BrooklynView {

    func configure() {
        wantsLayer = true
        // videoLayer must be a SUBLAYER, not the backing layer (`layer = videoLayer`).
        // When AVPlayerLayer is the backing layer, NSView sets internal properties
        // (contentsGravity, anchorPoint) that interfere with videoGravity, causing
        // the video to render at native size in a corner instead of being centered.
        layer?.backgroundColor = Constant.backgroundColor.cgColor
        layer?.addSublayer(videoLayer)
        videoLayer.videoGravity = .resizeAspect
        videoLayer.player = manager.player
    }
}

// MARK: - Preferences
extension BrooklynView {

    override var hasConfigureSheet: Bool {
        return true
    }

    override var configureSheet: NSWindow? {
        return preferences.window
    }
}
