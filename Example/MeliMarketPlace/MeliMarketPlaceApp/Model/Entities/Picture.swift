//
//  Picture.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

struct Picture: Codable {
    public private(set) var id: String = ""
    public private(set) var url: String = ""

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
