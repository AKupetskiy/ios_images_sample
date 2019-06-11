//
//  SimpleImageService.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

final class SimpleImageService: ImageService {
    let apiClient: APIClient

    init(apiClient: APIClient, completionQueue: DispatchQueue = .main) {
        self.apiClient = apiClient
    }

    func getPhotos(_ completion: @escaping (Result<[Photo], Error>) -> Void) {
        apiClient.get(PhotosRequest()) { response in
                switch response {
                case .success(let results):
                    completion(.success(results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    func getAlbums(_ completion: @escaping (Result<[Album], Error>) -> Void) {
        apiClient.get(AlbumsRequest()) { response in
            switch response {
            case .success(let results):
                completion(.success(results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func createPhoto(name: String, albumId: Int, _ completion: @escaping (Result<Void, Error>) -> Void) {
        let request = CreatePhotoRequest(name: name, albumId: albumId)
        
        apiClient.post(request) { response in
            switch response {
            case .success(_):
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }


    }
}
