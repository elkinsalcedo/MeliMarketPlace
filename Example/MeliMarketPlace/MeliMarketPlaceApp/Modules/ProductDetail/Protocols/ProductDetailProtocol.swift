//
//  ProductDetailViewProtocol.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

protocol ProductDetailRouterProtocol {
    static func createModule(product: ProductItem) -> UIViewController
    func pushToProductHomeScreen()
}

protocol ProductDetailPresenterProtocol: class{
    var view: ProductDetailViewProtocol? {get set}
    var router: ProductDetailRouterProtocol! {get set}
    var interactor: ProductDetailInteractorProtocol! {get set}
    var productItemId: ProductItem! {get set}
    
    func getImage(from url: String, onResponse: @escaping(_ data: Data?) -> Void)
    func buyNow()
}

protocol ProductDetailViewProtocol: class {
    var presenter: ProductDetailPresenterProtocol! {get set}
}

protocol ProductDetailInteractorProtocol: class {
    var presenter: ProductDetailPresenterProtocol! {get set}
    var apiService: ApiServiceProtocol! {get set}

    func getImage(from url: String, onResponse: @escaping(_ data: Data?) -> Void)
}
