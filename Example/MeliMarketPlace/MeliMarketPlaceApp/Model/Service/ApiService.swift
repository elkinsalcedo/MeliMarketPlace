//
//  ApiService.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class ApiService: ApiServiceProtocol {

    func getData(query: String, onResponse: @escaping(_ data: Data?) -> Void) {
        let filter = query.addingPercentEncoding(withAllowedCharacters: .urlUserAllowed)!

        self.getService(with: APISERVICE_SEARCH_URI + filter, header: APISERVICE_HEADER, onResponse: {(dataResponse) in
            onResponse(dataResponse)
        })
    }

    func getDataDetail(with id: String, onResponse: @escaping(_ data: Data?) -> Void) {
        self.getService(with: APISERVICE_SEARCH_ITEMS_URI + id, header: APISERVICE_HEADER, onResponse: {(dataResponse) in
            onResponse(dataResponse)
        })
    }

    func getService(with url: String, header: String, onResponse: @escaping(_ data: Data?) -> Void){
        Service().getRequest(with: url, header: header, onResponse: {(dataResponse) in
            onResponse(dataResponse)
        })
    }
}

