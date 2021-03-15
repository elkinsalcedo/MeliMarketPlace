//
//  ProductHomeInteractor.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class ProductHomeInteractor: ProductHomeInteractorProtocol {
    weak var presenter: ProductHomePresenterProtocol!
    var serviceApi: ServiceApiProtocol!
    
    func searchProducts(query: String) {
        guard !query.isEmpty else {
            self.presenter.productsNotFound(with: ERROR_SEARCH_EMPTY)
          return
        }

        let filter = query.addingPercentEncoding(withAllowedCharacters: .urlUserAllowed)!
        self.serviceApi?.getRequest(with: filter, onResponse: { (resultData: Data?) in
            DispatchQueue.main.async {
                do {
                    let products = try JSONDecoder().decode(Products.self, from: resultData!)
                    !products.results.isEmpty ?
                        self.presenter.productsFetched(products: products) :
                        self.presenter.productsNotFound(with: ERROR_PRODUCTS_NOT_FOUND)

                } catch {
                    MeliMarketPlaceLog.dLog(message: error.localizedDescription, function: "ProductHomeInteractor.searchProducts")
                    self.presenter.productsNotFound(with: ERROR_GENERAL_MESSAGE)
                }
            }
        })
    }
}
