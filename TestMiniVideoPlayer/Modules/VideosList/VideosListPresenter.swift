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
        enum ErrorState {
            
            //MARK: Static
            static let baseMessage = "Error fetching Videos list Data. Swipe down to reload Table or Check your WiFi Connection."
        }
    }
}


//MARK: - Presenter Coordinator Delegate protocol
protocol VideosListPresenterCoordinatorDelegate: AnyObject {
    func presenter(_ presenter: BaseSelectableListPresenterProtocol?, onGoToFullScreen withURL: URL?)
}



//MARK: - Main Presenter
final class VideosListPresenter {
    
    //MARK: Private
    private var apiClient: VideosListAPIClientProtocol?
    private var delegate: VideosListPresenterCoordinatorDelegate?
    private weak var view: VideosListTableViewControllerProtocol?
    
    
    //MARK: Initialization
    init(view: VideosListTableViewControllerProtocol?, apiClient: VideosListAPIClientProtocol?, delegate: VideosListPresenterCoordinatorDelegate?) {
        self.view = view
        self.apiClient = apiClient
        self.delegate = delegate
    }
}


//MARK: - Presenter protocol extension
extension VideosListPresenter: BaseSelectableListPresenterProtocol {
    
    //MARK: Internal
    func onViewDidLoad() {
        view?.setupMainUI()
        fetchVideos { [weak self] videos in
            self?.reloadTableView(with: videos)
        }
    }
    
    func onRefreshList() {
        fetchVideos { [weak self] videos in
            self?.reloadTableView(with: videos)
        }
        view?.endRefreshingControl()
    }
    
    func onDidSelect(for url: URL?) {
        guard let url = url else { return }
        delegate?.presenter(self, onGoToFullScreen: url)
    }
}


//MARK: - Main methods
private extension VideosListPresenter {
    
    //MARK: Private
    func fetchVideos(completion: @escaping (([Video]) -> ())) {
        Task {
            do {
                let dbModels = try await apiClient?.getVideos()
                DispatchQueue.main.async {
                    completion(dbModels ?? [])
                }
            } catch {
                DispatchQueue.main.async {
                    completion([])
                    self.view?.presentErrorAlert(with: Constants.ErrorState.baseMessage)
                }
            }
        }
    }
    
    func reloadTableView(with dbModels: [Video]) {
        view?.updateRows(VideosListFormatter.format(dbModels))
        view?.reloadTableView()
    }
}
