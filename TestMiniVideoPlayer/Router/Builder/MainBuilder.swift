//
//  MainBuilder.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-05.
//

import Foundation
import UIKit

//MARK: - Main Bulder protocol
protocol Builder {
    init(coordinator: MainCoordinator!)
    func showList() -> UIViewController
}


//MARK: - Main Bulder
final class MainBuilder {
    
    //MARK: Weak
    weak var coordinator: MainCoordinator!
    
    
    //MARK: Initialization
    init(coordinator: MainCoordinator!) {
        self.coordinator = coordinator
    }
}


//MARK: - Builder protocol extension
extension MainBuilder: Builder {
    
    //MARK: Internal
    internal func showList() -> UIViewController {
        let videosListURL = URL(string: URLs.videosListURL)
        let videosListVC = VideosListTableViewController()
        let videosListAPIClient = VideosListAPIClient(url: videosListURL)
        let presenter = VideosListPresenter(view: videosListVC, apiClient: videosListAPIClient)
        videosListVC.presenter = presenter
        return videosListVC
    }
}

