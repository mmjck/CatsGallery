//
//  DownloadServiceProtocol.swift
//  CatsGallery
//
//  Created by Jackson Matheus on 03/10/23.
//

import Foundation
import Combine


protocol DownloadServiceProtocol {
    func getImage(link: String?, completion: @escaping (Result<Data, NetWorkError>) -> Void)
}

class DownloadService: DownloadServiceProtocol {
    private let serviceLayer = GenericAPIService()
    
    func getImage(link: String?, completion: @escaping (Result<Data, NetWorkError>) -> Void) {
        guard let link = link, let url = URL(from: link) else {
            completion(.failure(NetWorkError.invalidURL))
            return
        }
        
        
        let _ = serviceLayer.requestDataTask(for: url, completion: completion)
    }
}
