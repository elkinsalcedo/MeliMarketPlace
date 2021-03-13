//
//  ProductListPresenter.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class ProductListPresenter: ProductListPresenterProtocol {
    weak var view: ProductListViewProtocol?
    var router: ProductListRouterProtocol!
    var interactor: ProductListInteractorProtocol!

    var productList: Products!

    func productSelected(itemId: String) {
        self.interactor.getProductDetail(itemId: itemId)
    }

    func productFetched(product: ProductItem) {
        self.router.pushToProductDetailScreen(productItemId: product)
    }

    func failedProduct(with message: String) {
        self.view?.failedProduct(with: message)
    }

    func getImage(from url: String, onResponse: @escaping(_ data: Data?) -> Void) {
        self.interactor.getImage(from: url, onResponse: { (resultData: Data?) in
            onResponse(resultData)
        })
    }
}
