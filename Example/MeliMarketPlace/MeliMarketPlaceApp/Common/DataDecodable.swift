//
//  DataDecodable.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/13/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

struct DataDecodable<Base : Decodable> : Decodable {

    let base: Base?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}
