//
//  MockProductHomeInteractor.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
@testable import MeliMarketPlace_Example

class MockProductHomeInteractor: ProductHomeInteractorProtocol {
    var presenter: ProductHomePresenterProtocol!
    var serviceApi: ServiceApiProtocol!
    var calledMethod = ""

    func searchProducts(query: String) {

        switch calledMethod {
            case "ProductsFetched":
                self.presenter?.productsFetched(products: Products.init(results: []))
            case "ProductsNotFound":
                self.presenter?.productsNotFound(with: "")
            default:
                self.calledMethod = "searchProducts"
        }
    }
}
