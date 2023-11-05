//
//  Video.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-03.
//

import Foundation

struct Video: Codable {
    let description: String
    let sources: [String]
    let subtitle: String
    let thumb: String
    let title: String
}

struct Category: Codable {
    let name: String
    let videos: [Video]
}

struct VideoData: Codable {
    let categories: [Category]
}
