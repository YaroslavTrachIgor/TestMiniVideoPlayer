//
//  VideoCellUIModel.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-03.
//

import Foundation
import UIKit

//MARK: - Main UIModel
struct VideoCellUIModel {
    let title: String!
    let subtitle: String!
    let previewImageURL: URL!
    let url: URL!
}


//MARK: - Cell UIModel protocol extension
extension VideoCellUIModel: BaseCellUIModel {
    
    //MARK: Internal
    func setup(cell: VideoTableViewCell) {
        cell.titleLabel.text = title
        cell.subtitleLabel.text = subtitle
        cell.previewImageView.downloadImage(with: previewImageURL)
        cell.iconImageView.downloadImage(with: previewImageURL)
        cell.previewVideoView.configurePlayer(with: url)
    }
}
