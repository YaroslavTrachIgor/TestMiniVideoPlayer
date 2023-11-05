//
//  VideosListAPIClient.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-03.
//

import Foundation

//MARK: - VideosList API client protocol
protocol VideosListAPIClientProtocol {
    func getVideos() async throws -> [Video]?
}


//MARK: - VideosList API client
final class VideosListAPIClient: APIHelper, VideosListAPIClientProtocol {
    
    //MARK: Internal
    func getVideos() async throws -> [Video]? {
        do {
            let data = try await self.get()
            if let response: VideoData = JSONHelper.decode(data) {
                let videos = response.categories[0].videos
                return videos
            } else {
                return []
            }
        } catch {
            throw APIError.ACRequestError.unknownApplicationAPIGetError
        }
    }
}
