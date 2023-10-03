//
//  AdConfig.swift
//  CatsGallery
//
//  Created by Jackson Matheus on 03/10/23.
//

import Foundation

import Foundation

struct AdConfig: Codable {
    let safeFlags: [String]?
    let highRiskFlags: [String]?
    let unsafeFlags, wallUnsafeFlags: [String]?
    let showsAds: Bool?
    let showAdLevel: Int?
    let adConfigSafeFlags: [String]?
    let adConfigHighRiskFlags: [String]?
    let adConfigUnsafeFlags, adConfigWallUnsafeFlags: [String]?
    let showAds: Bool?
    let adConfigShowAdLevel: Int?
    let nsfwScore: Double?

    enum CodingKeys: String, CodingKey {
        case safeFlags, highRiskFlags, unsafeFlags, wallUnsafeFlags, showsAds, showAdLevel
        case adConfigSafeFlags = "safe_flags"
        case adConfigHighRiskFlags = "high_risk_flags"
        case adConfigUnsafeFlags = "unsafe_flags"
        case adConfigWallUnsafeFlags = "wall_unsafe_flags"
        case showAds = "show_ads"
        case adConfigShowAdLevel = "show_ad_level"
        case nsfwScore = "nsfw_score"
    }
}
