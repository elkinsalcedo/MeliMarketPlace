//
//  ProductHomeRouter.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class ProductHomeRouter: ProductHomeRouterProtocol {
    weak var productHomeViewController: UIViewController?

    static func createModule(view: ProductHomeViewController) -> UIViewController? {
        let presenter = ProductHomePresenter()
        let router = ProductHomeRouter()
        let interactor = ProductHomeInteractor()
        let apiService = ApiService()

        view.presenter = presenter
        view.presenter?.router = router

        presenter.view = view
        presenter.interactor = interactor
        presenter.interactor?.presenter = presenter
        presenter.interactor?.apiService = apiService

        router.productHomeViewController = view

        return view
    }

    func pushToProductListScreen(productList: Products) {
        let productListViewController = ProductListRouter.createModule(productList: productList)
        self.productHomeViewController?.navigationController?.pushViewController(productListViewController, animated: true)
    }
}
