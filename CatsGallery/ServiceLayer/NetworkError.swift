//
//  NetworkError.swift
//  CatsGallery
//
//  Created by Jackson Matheus on 03/10/23.
//

import Foundation


enum NetWorkError: Error {
    case generic(error: Error)
    case invalidURL
    case noData
    case parsingError(error: Error)
}


enum HTTPMethod: String {
    case GET = "GET"
}
