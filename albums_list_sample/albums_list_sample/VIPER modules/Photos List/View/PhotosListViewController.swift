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

    @IBAction func createButtonPressed() {
        output?.createButtonPressed()
    }

    // MARK: - PhotosListViewInput

    func setupView() {
        tableView.tableFooterView = UIView()
    }

    func display(photos: [PhotosListItem]) {
        self.photos = photos

        tableView.reloadData()
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

