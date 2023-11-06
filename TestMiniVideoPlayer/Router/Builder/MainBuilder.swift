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
    func showList(delegate: VideosListPresenterCoordinatorDelegate?) -> UIViewController
    func showDetail(with url: URL?) -> UIViewController
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
    internal func showList(delegate: VideosListPresenterCoordinatorDelegate?) -> UIViewController {
        let videosListURL = URL(string: URLs.videosListURL)
        let videosListVC = VideosListTableViewController()
        let videosListAPIClient = VideosListAPIClient(url: videosListURL)
        let presenter = VideosListPresenter(view: videosListVC, apiClient: videosListAPIClient, delegate: delegate)
        videosListVC.presenter = presenter
        return videosListVC
    }
    
    internal func showDetail(with url: URL?) -> UIViewController {
        let detailVideoVC = DetailVideoViewController()
        let presenter = DetailVideoPresenter(view: detailVideoVC, videoURL: url)
        detailVideoVC.presenter = presenter
        return detailVideoVC
    }
}

