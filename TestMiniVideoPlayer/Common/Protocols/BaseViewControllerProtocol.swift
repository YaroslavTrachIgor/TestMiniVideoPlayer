//
//  BaseViewControllerProtocol.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-04.
//

import Foundation

protocol BaseViewControllerProtocol: AnyObject {
    func setupMainUI()
}

protocol BaseTableViewControllerProtocol: BaseViewControllerProtocol {
    func reloadTableView()
}
