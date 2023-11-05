//
//  VideosListTableViewController.swift
//  TestMiniVideoPlayer
//
//  Created by User on 2023-11-03.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

//MARK: - Constants
private enum Constants {
    static let title = "Movies"
    static let cellKey = "VideosListTableViewCell"
}


//MARK: - TableViewController protocol
protocol VideosListTableViewControllerProtocol: BaseTableViewControllerProtocol {
    func updateRows(_ newRows: [VideoCellUIModel])
    func presentErrorAlert(with errorDescription: String)
}


//MARK: - Main TableViewController
final class VideosListTableViewController: UITableViewController {
        
    var presenter: BasePresenterProtocol?
    
    //MARK: Private
    private var rows = [VideoCellUIModel]()
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.onViewDidLoad()
    }

    //MARK: TableView protocols
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withModel: row, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let visibleCell = cell as? VideoTableViewCell {
            visibleCell.previewVideoView.playPreviewVideo()
        }
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let invisibleCell = cell as? VideoTableViewCell {
            invisibleCell.previewVideoView.stopPreviewVideo()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoURL = rows[indexPath.row].url
        guard let videoURL = videoURL else { return }
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
}


//MARK: - ViewController protocol extension
extension VideosListTableViewController: VideosListTableViewControllerProtocol {

    //MARK: Internal
    func setupMainUI() {
        setupTableView()
        title = Constants.title
    }
    
    internal func reloadTableView() {
        tableView.reloadData()
    }
    
    internal func updateRows(_ newRows: [VideoCellUIModel]) {
        self.rows = newRows
    }
    
    internal func presentErrorAlert(with errorDescription: String) {
        AlertManager.presentError(message: errorDescription, on: self)
    }
}


//MARK: - Main methods
private extension VideosListTableViewController {
    
    //MARK: Private
    func setupTableView() {
        let cellKey = String(describing: VideoTableViewCell.self)
        let cellNib = UINib(nibName: Constants.cellKey, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellKey)
        tableView.separatorColor = .clear
        tableView.rowHeight = 270
    }
}
