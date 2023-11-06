//
//  DetailVideoViewController.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-06.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

//MARK: - Main ViewController
protocol DetailVideoViewControllerProtocol: BaseViewControllerProtocol {
    func playVideo(with url: URL!)
}


//MARK: - Main ViewController
final class DetailVideoViewController: AVPlayerViewController {
    
    var presenter: BasePresenterProtocol?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.onViewDidLoad()
    }
}


//MARK: - ViewController protocol extension
extension DetailVideoViewController: DetailVideoViewControllerProtocol {
    
    //MARK: Internal
    internal func setupMainUI() {
        navigationController?.navigationBar.tintColor = .white
    }
    
    internal func playVideo(with url: URL!) {
        let player = AVPlayer(url: url)
        self.player = player
        self.player?.play()
    }
}

