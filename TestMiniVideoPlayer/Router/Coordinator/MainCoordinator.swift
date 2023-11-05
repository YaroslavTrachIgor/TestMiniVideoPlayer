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
        let rootVC = builder?.showList()
        navigationController.pushViewController(rootVC!, animated: true)
    }
}
