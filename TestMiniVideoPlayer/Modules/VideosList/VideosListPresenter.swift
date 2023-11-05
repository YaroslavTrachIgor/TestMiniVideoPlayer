//
//  VideosListPresenter.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-03.
//

import Foundation

//MARK: - Constants
private extension VideosListPresenter {
    
    //MARK: Private
    enum Constants {
        enum ErrorMessage {
            
            //MARK: Static
            static let basicMessage = "Error fetching GitHub Users Data:"
        }
    }
}


//MARK: - Main Presenter
final class VideosListPresenter {
    
    //MARK: Private
    private var apiClient: VideosListAPIClientProtocol?
    private weak var view: VideosListTableViewControllerProtocol?
    
    
    //MARK: Initialization
    init(view: VideosListTableViewControllerProtocol) {
        self.view = view
        self.apiClient = VideosListAPIClient(url: URL(string: URLs.videosListURL))
    }
}


//MARK: - Presenter protocol extension
extension VideosListPresenter: BasePresenterProtocol {
    
    //MARK: Internal
    internal func onViewDidLoad() {
        view?.setupMainUI()
        fetchVideos { [weak self] videos in
            self?.reloadTableView(with: videos)
        }
    }
}


//MARK: - Main methods
private extension VideosListPresenter {
    
    //MARK: Private
    func fetchVideos(completion: @escaping (([Video]) -> ())) {
        Task {
            do {
                let dbModels = try await apiClient?.getVideos()
                print(dbModels?.count ?? 0)
                DispatchQueue.main.async {
                    completion(dbModels ?? [])
                }
            } catch {
                print(Constants.ErrorMessage.basicMessage)
                print(error)
                DispatchQueue.main.async {
                    self.view?.presentErrorAlert(with: error.localizedDescription)
                    completion([])
                }
            }
        }
    }
    
    func reloadTableView(with dbModels: [Video]) {
        view?.updateRows(VideosListFormatter.format(dbModels))
        view?.reloadTableView()
    }
}


//ADD ERROR HANDLING CODE

//ADD COORDINATOR

//ADD SEARCH
