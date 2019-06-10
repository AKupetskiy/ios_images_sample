//
//  PhotosListTableViewCell.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit

class PhotosListTableViewCell: UITableViewCell {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!

    private var item: PhotosListItem!

    func configureWith(item: PhotosListItem) {
        self.item = item

        self.albumTitleLabel.text = item.title

        self.item.onThumbProvided = { [weak self] image in
            self?.albumImageView.image = image
        }
    }
}
