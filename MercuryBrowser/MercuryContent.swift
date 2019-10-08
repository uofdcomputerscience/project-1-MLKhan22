//
//  MercuryContent.swift
//  MercuryBrowser
//
//  Created by Minh Ly on 10/7/19.
//  Copyright © 2019 Minh Ly. All rights reserved.
//

import Foundation

struct MercuryList: Codable {
    let mercury: [Content]
}

struct Content: Codable {
    let name: String
    let type: String
    let url: String
}

