//
//  ImageStorage.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation
import UIKit


enum ImageStorageError: Error {
    case networkError(decription: String, code: Int)
    case invalidParams
    case invalidResponse
    case unknown
}

protocol ImageStorage: class {
    var callbackQueue: DispatchQueue { get }

    func provideImage(_ imageURL: String, completion: @escaping (Result<(url: String, image: UIImage?), ImageStorageError>) -> Void)
}
