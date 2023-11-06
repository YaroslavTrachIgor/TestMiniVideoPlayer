//
//  MainCoordinator.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-05.
//

import Foundation
import UIKit

//MARK: - Base Coordinator protocol
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}


//MARK: - Main Coordinator protocol
protocol MainCoordinatorProtocol: Coordinator {
    var builder: MainBuilder? { get set }
}


//MARK: - Main Coordinator
final class MainCoordinator: Coordinator {
    var builder: MainBuilder?
    var navigationController: UINavigationController
    
    
    //MARK: Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.builder = MainBuilder(coordinator: self)
    }
}


//MARK: - Main Coordinator protocol extension
extension MainCoordinator: MainCoordinatorProtocol {
    
    //MARK: Internal
    internal func start() {
        let rootVC = builder?.showList(delegate: self)
        navigationController.pushViewController(rootVC!, animated: true)
    }
    
    internal func goToDetail(with url: URL?) {
        let detailVC = builder?.showDetail(with: url)
        navigationController.pushViewController(detailVC!, animated: true)
    }
}


//MARK: - VideosList Delegate protocol extension
extension MainCoordinator: VideosListPresenterCoordinatorDelegate {
    
    //MARK: Internal
    func presenter(_ presenter: BaseSelectableListPresenterProtocol?, onGoToFullScreen withURL: URL?) {
        goToDetail(with: withURL)
    }
}
