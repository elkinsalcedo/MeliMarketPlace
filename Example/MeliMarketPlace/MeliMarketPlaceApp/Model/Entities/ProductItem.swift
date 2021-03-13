//
//  ProductItem.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

struct ProductItem: Codable {
    public private(set) var body: Product

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
