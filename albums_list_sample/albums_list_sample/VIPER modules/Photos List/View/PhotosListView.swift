//
//  PhotosListView.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

protocol PhotosListViewInput: AnyObject {
    var output: PhotosListViewOutput? { get }

    func display(photos: [PhotosListItem])
    func display(error: Error)

    func setupView()
}

protocol PhotosListViewOutput: AnyObject {
    func viewLoaded()
    func createButtonPressed()
}
