//
//  AlertManager.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-04.
//

import Foundation
import UIKit

private enum Constants {
    
    //MARK: Static
    static let errorTitle = "Error"
    static let okTitle = "OK"
}

//MARK: - Main Manager
final class AlertManager {
    
    //MARK: Static
    static func present(title: String, message: String, on vc: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.okTitle, style: .cancel))
        vc.present(alertController, animated: true)
    }
}


//MARK: - Fast methods
extension AlertManager {
    
    //MARK: Static
    static func presentError(message: String, on vc: UIViewController) {
        present(title: Constants.errorTitle, message: message, on: vc)
    }
}
