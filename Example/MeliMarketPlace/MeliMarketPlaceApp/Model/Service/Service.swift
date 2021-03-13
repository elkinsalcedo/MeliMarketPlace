//
//  Service.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/13/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import MeliMarketPlace

class Service: ServiceProtocol {

    func getRequest(with url: String, header: String, onResponse: @escaping(_ data: Data?) -> Void) {
        NetworkController().getRequest(urlString: url , header: header, onResponse: { (dataResponse) in
            if (dataResponse.code == HTTPStatusCode.ok.rawValue) {
                onResponse(dataResponse.data)
            } else {
                onResponse(Data())
            }
        })
    }
}
