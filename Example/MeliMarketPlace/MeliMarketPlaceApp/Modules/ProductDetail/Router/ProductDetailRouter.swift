//
//  ProductDetailRouter.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailRouter: ProductDetailRouterProtocol {
    weak var productDetailViewController: UIViewController?

    static func createModule(product: ProductItem) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailViewController
        let presenter = ProductDetailPresenter()
        let router = ProductDetailRouter()
        let interactor = ProductDetailInteractor()
        let serviceApi = ServiceApiFactory().meliServiceApiGetImage

        view.presenter = presenter
        view.presenter?.productItemId = product
        view.presenter?.router = router
        view.presenter?.view = view

        view.presenter?.interactor = interactor
        view.presenter?.interactor?.presenter = presenter
        view.presenter?.interactor?.serviceApi = serviceApi
        
        router.productDetailViewController = view
        return view
    }

    func pushToProductHomeScreen() {
        let productHomeView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductHomeVC") as! ProductHomeViewController
        let productHomeViewController = ProductHomeRouter.createModule(view: productHomeView)
        self.productDetailViewController?.navigationController?.pushViewController(productHomeViewController!, animated: false)
    }
}
