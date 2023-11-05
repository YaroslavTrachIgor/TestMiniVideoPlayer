//
//  VideosListTableViewCell.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-04.
//

import UIKit
import AVKit

//MARK: - Main Cell
final class VideoTableViewCell: UITableViewCell {
    
    //MARK: @IBOutlets
    @IBOutlet weak var previewVideoView: PreviewVideoView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.layer.masksToBounds = true
            iconImageView.layer.cornerRadius = iconImageView.frame.height / 2
        }
    }
    
    //MARK: @@IBActions
    @IBAction func unmute(_ sender: UIButton) {
        sender.setImage(previewVideoView.unmute(), for: .normal)
    }
}



