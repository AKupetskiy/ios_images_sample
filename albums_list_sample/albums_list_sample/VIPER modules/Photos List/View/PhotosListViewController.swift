//
//  PhotosListViewController.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/8/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit

class PhotosListViewController: UITableViewController, PhotosListViewInput {
    var output: PhotosListViewOutput?

    private var photos = [PhotosListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewLoaded()
    }

    // MARK: - PhotosListViewInput

    func setupView() {
        tableView.tableFooterView = UIView()

        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 100.0;
    }

    func display(photos: [PhotosListItem]) {
        self.photos = photos

        tableView.reloadData()
    }

    func display(error: Error) {
        let alertController = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
        }

        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }

    // MARK: - Table view calls

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosListCell", for: indexPath) as! PhotosListTableViewCell
        cell.configureWith(item: photos[indexPath.row])

        return cell
    }
}

