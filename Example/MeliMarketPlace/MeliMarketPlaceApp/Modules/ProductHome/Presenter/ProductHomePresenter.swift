//
//  ProductHomePresenter.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class ProductHomePresenter: ProductHomePresenterProtocol {
    weak var view: ProductHomeViewProtocol?
    var router: ProductHomeRouterProtocol!
    var interactor: ProductHomeInteractorProtocol!

    func searchProducts(query: String) {
        self.interactor?.searchProducts(query: query)
    }

    func productsFetched(products: Products) {
        self.router.pushToProductListScreen(productList: products)
    }

    func productsNotFound(with message: String) {
        self.view?.showMessageOnScreen(msg: message)
    }
}
