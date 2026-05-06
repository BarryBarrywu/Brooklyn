//
//  URLType.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 23/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Cocoa

// MARK: - URLType
enum URLType: String {
    case help = "https://github.com/barrybarrywu/Brooklyn/issues"
    case github = "https://github.com/barrybarrywu/Brooklyn"
    case twitter = "https://recents.notion.site/"
    case version = "https://github.com/barrybarrywu/Brooklyn/releases"
}

// MARK: Functions
extension URLType {
    
    func open() {
        guard let url = URL(string: rawValue) else { return }
        NSWorkspace.shared.open(url)
    }
}
