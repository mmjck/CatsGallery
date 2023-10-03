//
//  GenericApiService.swift
//  CatsGallery
//
//  Created by Jackson Matheus on 03/10/23.
//

import Foundation
import Combine

typealias APICompletion<T: Codable> = (Result<T, NetWorkError>) -> Void
typealias DataCompletion = (Result<Data, NetWorkError>) -> Void

class GenericAPIService {
    func requestDataTask<T: Codable>(for url:URL?, httpMethod: HTTPMethod, completion: @escaping APICompletion<T>){
        
        
        guard let url = url else {
            completion(.failure(NetWorkError.invalidURL))
            return
        }
        
        
        //        let clientId = ""
        
        let clientId = "c92cb11f96fa019"
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("Client-ID \(clientId)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.generic(error: error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let parsedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(parsedData))
            } catch let error {
                completion(.failure(.parsingError(error: error)))
            }
        }
        task.resume()
    }
    
    
    func requestDataTask(for url: URL, completion: @escaping DataCompletion){
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.generic(error: error)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }
        task.resume()
        
    }
}
