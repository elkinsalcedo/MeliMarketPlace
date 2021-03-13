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
    var apiService: ApiServiceProtocol!
    
    func searchProducts(query: String) {
        self.apiService?.getData(query: query, onResponse: { (resultData: Data?) in
            DispatchQueue.main.async {
                do {
                    let products = try JSONDecoder().decode(Products.self, from: resultData!)
                    !products.results.isEmpty ?
                        self.presenter.productsFetched(products: products) :
                        self.presenter.productsNotFound(with: ERROR_PRODUCTS_NOT_FOUND)

                } catch {
                    self.presenter.productsNotFound(with: ERROR_GENERAL_MESSAGE)
                }
            }
        })
    }
}
