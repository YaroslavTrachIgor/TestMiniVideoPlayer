//
//  PreviewVideoView.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-04.
//

import UIKit
import AVKit

//MARK: - Main View
public class PreviewVideoView: UIView {

    //MARK: Public
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer!

    
    //MARK: Lifecycle
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        playerLayer.frame = self.bounds
    }
    
    //MARK: Public
    func configurePlayer(with url: URL!) {
        guard let url = url else { return }
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        player?.isMuted = true
        layer.addSublayer(playerLayer)
        alpha = 0
    }
    
    @discardableResult func unmute() -> UIImage! {
        player?.isMuted.toggle()
        if player!.isMuted {
            return UIImage(systemName: "speaker.slash.fill")
        } else {
            return UIImage(systemName: "speaker.fill")
        }
    }
    
    func playPreviewVideo() {
        player?.play()
        alpha = 1
    }
    
    func stopPreviewVideo() {
        player?.pause()
        alpha = 0
    }
}
