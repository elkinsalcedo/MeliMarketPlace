//
//  MeliServiceApi.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class MeliServiceApi: ServiceApiProtocol {

    private var url = ""
    private var header = ""

    init(with url: String = "", header: String = "") {
        self.url = url
        self.header = header
    }

    func getRequest(with query: String, onResponse: @escaping(_ data: Data?) -> Void) {
        NetworkController().getRequest(urlString: self.url + query, header: self.header, onResponse: { (dataResponse) in
            if (dataResponse.code == HTTPStatusCode.ok.rawValue) {
                onResponse(dataResponse.data)
            } else {
                onResponse(Data())
            }
        })
    }
}

