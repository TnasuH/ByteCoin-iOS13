//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Tarık Nasuhoğlu on 7.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coinModel = try? newJSONDecoder().decode(CoinModel.self, from: jsonData)

import Foundation

// MARK: - CoinModel
struct CoinData: Codable {
    
    let asset_id_base, asset_id_quote: String
    let rate: Double

}
