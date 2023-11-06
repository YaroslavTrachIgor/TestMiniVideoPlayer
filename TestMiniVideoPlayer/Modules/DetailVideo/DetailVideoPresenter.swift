//
//  DetailVideoPresenter.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-06.
//

import Foundation

//MARK: - Main Presenter
final class DetailVideoPresenter {
    
    //MARK: Private
    private var videoURL: URL?
    private weak var view: DetailVideoViewController?
    
    //MARK: Initialization
    init(view: DetailVideoViewController?, videoURL: URL?) {
        self.videoURL = videoURL
        self.view = view
    }
}


//MARK: - Presenter protocol extension
extension DetailVideoPresenter: BasePresenterProtocol {
    
    //MARK: Internal
    func onViewDidLoad() {
        view?.setupMainUI()
        view?.playVideo(with: videoURL)
    }
}
