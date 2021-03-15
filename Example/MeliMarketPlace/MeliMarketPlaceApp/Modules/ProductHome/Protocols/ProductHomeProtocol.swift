//
//  ProductHomeProtocol.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

protocol ProductHomeViewProtocol: class {
    var presenter: ProductHomePresenterProtocol! {get set}
    func showMessageOnScreen(msg: String)
}

protocol ProductHomePresenterProtocol: class {
    var view: ProductHomeViewProtocol? {get set}
    var router: ProductHomeRouterProtocol! {get set}
    var interactor: ProductHomeInteractorProtocol! {get set}

    func searchProducts(query: String)
    func productsFetched(products: Products)
    func productsNotFound(with message: String)
}

protocol ProductHomeRouterProtocol {
    var productHomeViewController: UIViewController? { get set }

    static func createModule(view: ProductHomeViewController) -> UIViewController?
    func pushToProductListScreen(productList: Products)
}

protocol ProductHomeInteractorProtocol: class {
    var presenter: ProductHomePresenterProtocol! {get set}
    var serviceApi: ServiceApiProtocol! {get set}

    func searchProducts(query: String)
}
