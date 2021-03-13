//
//  Product.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

struct Product: Codable {
    public private(set) var id: String = ""
    public private(set) var title: String = ""
    public private(set) var price: Double = 0.0
    public private(set) var thumbnail: String = ""
    public private(set) var pictures: [Picture]? = []

    public func toData() -> Data {
        return serverModelToData()
    }

    private func serverModelToData() -> Data {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return Data()
        }
    }
}
