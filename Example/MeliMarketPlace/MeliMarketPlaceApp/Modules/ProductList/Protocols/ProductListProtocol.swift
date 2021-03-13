//
//  ProductListProtocol.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

protocol ProductListPresenterProtocol: class {
    var view: ProductListViewProtocol? {get set}
    var router: ProductListRouterProtocol! {get set}
    var interactor: ProductListInteractorProtocol! {get set}
    var productList: Products! {get set}
    
    func productSelected(itemId: String)
    func productFetched(product: ProductItem)
    func failedProduct(with message: String)
    func getImage(from url: String,  onResponse: @escaping(_ data: Data?) -> Void) 
}

protocol ProductListViewProtocol: class{
    var presenter: ProductListPresenterProtocol! {get set}

    func failedProduct(with message: String)
}

protocol ProductListInteractorProtocol: class {
    var presenter: ProductListPresenterProtocol! {get set}
    var apiService: ApiServiceProtocol! {get set}

    func getProductDetail(itemId: String)
    func getImage(from url: String, onResponse: @escaping(_ data: Data?) -> Void)
}

protocol ProductListRouterProtocol {
    static func createModule(productList: Products) -> UIViewController
    func pushToProductDetailScreen(productItemId: ProductItem)
}
