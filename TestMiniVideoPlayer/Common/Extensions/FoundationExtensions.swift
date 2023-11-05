//
//  FoundationExtensions.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-03.
//

import Foundation

//MARK: - Fast URL Response checks
public extension HTTPURLResponse {
    
    //MARK: Public
    var isValidStatusCode: Bool {
        return (200...299).contains(self.statusCode)
    }
}


//MARK: - Fast String methods
public extension String {
    
    //MARK: Public
    func transformHttpToHttps() -> String {
        var transformedURL: String = ""
        if self.hasPrefix("http://") {
            transformedURL = self.replacingOccurrences(of: "http://", with: "https://")
        }
        return transformedURL
    }
}
