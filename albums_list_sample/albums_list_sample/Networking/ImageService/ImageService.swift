//
//  ImageService.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

protocol ImageService {
    var apiClient: APIClient { get }
    
    func getPhotos(_ completion: @escaping (Result<[Photo], Error>) -> Void)
}
