//
//  APIResponse.swift
//  CatsGallery
//
//  Created by Jackson Matheus on 03/10/23.
//

import Foundation


struct APIResponse: Codable {
    let data: [PostData]
    let success: Bool?
    let status: Int?
}
