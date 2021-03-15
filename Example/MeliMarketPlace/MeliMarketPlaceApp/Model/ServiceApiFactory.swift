//
//  ServiceApiFactory.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/13/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

struct ServiceApiFactory {

    var meliServiceApiSearchProducts: ServiceApiProtocol {
        return MeliServiceApi(with: SERVICEAPI_SEARCH_URI, header: SERVICEAPI_HEADER)
    }

    var meliServiceApiSearchItemProducts: ServiceApiProtocol {
        return MeliServiceApi(with: SERVICEAPI_SEARCH_ITEMS_URI, header: SERVICEAPI_HEADER)
    }

    var meliServiceApiGetImage: ServiceApiProtocol {
        return MeliServiceApi(header: SERVICEAPI_HEADER)
    }
}
