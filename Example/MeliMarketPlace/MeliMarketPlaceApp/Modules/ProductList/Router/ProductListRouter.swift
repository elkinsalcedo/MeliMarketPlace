//
//  ProductListRouter.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class ProductListRouter: ProductListRouterProtocol {
    weak var productListViewController: UIViewController?

    static func createModule(productList: Products) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductListVC") as! ProductListViewController
        let presenter = ProductListPresenter()
        let router = ProductListRouter()
        let interactor = ProductListInteractor()
        let apiService = ApiService()

        view.presenter = presenter
        view.presenter?.productList = productList
        view.presenter?.router = router
        view.presenter?.view = view
        view.presenter?.interactor = interactor
        view.presenter?.interactor?.presenter = presenter
        view.presenter?.interactor?.apiService = apiService

        router.productListViewController = view
        return view
    }

    func pushToProductDetailScreen(productItemId: ProductItem) {
        let productDetailViewController = ProductDetailRouter.createModule(product: productItemId)
        self.productListViewController?.navigationController?.pushViewController(productDetailViewController, animated: true)
    }
}
