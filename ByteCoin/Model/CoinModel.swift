//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Tarık Nasuhoğlu on 7.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

// MARK: - CoinModel
struct CoinModel {
    
    let assetIDBase, assetIDQuote: String
    let rate: Double
    var rateString: String {
        return String(format: "%.4f",rate)
    }
    
}
