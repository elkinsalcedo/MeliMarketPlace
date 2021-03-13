//
//  ProductDetailPresenter.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    weak var view: ProductDetailViewProtocol?
    var router: ProductDetailRouterProtocol!
    var interactor: ProductDetailInteractorProtocol!
    var productItemId: ProductItem!

    func getImage(from url: String, onResponse: @escaping(_ data: Data?) -> Void) {
        self.interactor.getImage(from: url, onResponse: { (resultData: Data?) in
            onResponse(resultData)
        })
    }
    
    func buyNow(){
        self.router.pushToProductHomeScreen()
    }
}
