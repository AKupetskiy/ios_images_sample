//
//  PhotosListView.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

protocol PhotosListViewInput: class {
    var output: PhotosListViewOutput? { get }

    func display(photos: [PhotosListItem])
    func display(error: Error)

    func setupView()
}

protocol PhotosListViewOutput: class {
    func viewLoaded()
}
