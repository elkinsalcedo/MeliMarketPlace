//
//  ApiServiceProtocol.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

protocol ApiServiceProtocol {
    func getData(query: String, onResponse: @escaping(_ data: Data?) -> Void)
    func getDataDetail(with id: String, onResponse: @escaping(_ data: Data?) -> Void)
    func getService(with url: String, header: String, onResponse: @escaping(_ data: Data?) -> Void)
}

protocol ServiceProtocol {
    func getRequest(with url: String, header: String, onResponse: @escaping(_ data: Data?) -> Void)
}
