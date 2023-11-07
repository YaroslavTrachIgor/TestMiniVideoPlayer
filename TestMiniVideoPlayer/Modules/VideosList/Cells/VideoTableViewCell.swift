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
    @IBOutlet weak var contentBackgroundBlurView: UIVisualEffectView! {
        didSet {
            contentBackgroundBlurView.clipsToBounds = true
            contentBackgroundBlurView.layer.cornerRadius = 20
            contentBackgroundBlurView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
    @IBOutlet weak var backgroundContentView: UIView! {
        didSet {
            backgroundContentView.layer.cornerRadius = 20
            backgroundContentView.layer.shadowColor = UIColor.systemGray2.cgColor
            backgroundContentView.layer.shadowRadius = 8
            backgroundContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
            backgroundContentView.layer.shadowOpacity = 0.7
        }
    }
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
