//
//  BasePresenterProtocol.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-04.
//

import Foundation

protocol BasePresenterProtocol {
    func onViewDidLoad()
}

protocol BaseListPresenterProtocol: BasePresenterProtocol {
    func onRefreshList()
}

protocol BaseSelectableListPresenterProtocol: BaseListPresenterProtocol {
    func onDidSelect(for row: Int)
}
