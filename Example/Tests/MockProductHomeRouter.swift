//
//  MockProductHomeRouter.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
@testable import MeliMarketPlace_Example

class MockProductHomeRouter: ProductHomeRouterProtocol{
    var productHomeViewController: UIViewController?
    var calledMethod = ""

    static func createModule(view: ProductHomeViewController) -> UIViewController? {
        return ProductHomeRouter.createModule(view: view)
    }

    func pushToProductListScreen(productList: Products) {
        self.calledMethod = "pushToProductListScreen"
    }

}
