//
//  ModelEnums.swift
//  CatsGallery
//
//  Created by Jackson Matheus on 03/10/23.
//

import Foundation

enum TypeError: Error {
    case unknownValue
}

enum AnyCodable: Codable {
    case int(Int)
    case string(String)
    case bool(Bool)
    
    init(from decoder: Decoder) throws {
        if let intValue = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(intValue)
        } else if let stringValue = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(stringValue)
        } else if let boolValue = try? decoder.singleValueContainer().decode(Bool.self) {
            self = .bool(boolValue)
        } else {
            throw TypeError.unknownValue
        }
    }
}
