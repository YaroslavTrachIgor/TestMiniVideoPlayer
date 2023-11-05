//
//  VideosListFormatter.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-03.
//

import Foundation

//MARK: - Main Formatter
final class VideosListFormatter {
    
    //MARK: Static
    static func format(_ dbModels: [Video]) -> [VideoCellUIModel] {
        return dbModels.compactMap { video in
            VideoCellUIModel(
                title: video.title,
                subtitle: video.subtitle,
                previewImageURL: URL(string: video.thumb.transformHttpToHttps()),
                url: URL(string: video.sources[0].transformHttpToHttps()))
        }
    }
}
