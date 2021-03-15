//
//  ServiceApiProtocol.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

protocol ServiceApiProtocol {
    func getRequest(with query: String, onResponse: @escaping(_ data: Data?) -> Void)
}
