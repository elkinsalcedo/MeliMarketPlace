//
//  ProductListInteractor.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class ProductListInteractor: ProductListInteractorProtocol {
    weak var presenter: ProductListPresenterProtocol!
    var serviceApi: ServiceApiProtocol!
    var serviceApiImage: ServiceApiProtocol!

    func getProductDetail(itemId: String) {
        self.serviceApi?.getRequest(with: itemId, onResponse: { (resultData: Data?) in
            DispatchQueue.main.async {
                do {
                    let productItem = try JSONDecoder()
                        .decode([DataDecodable<ProductItem>].self, from: resultData!)
                        .compactMap { $0.base }

                    self.presenter.productFetched(product: productItem[0])
                } catch {
                    MeliMarketPlaceLog.dLog(message: error.localizedDescription, function: "ProductListInteractor.getProductDetail")
                    self.presenter.failedProduct(with: ERROR_GENERAL_MESSAGE)
                }
            }
        })
    }

    func getImage(from url: String, onResponse: @escaping(_ data: Data?) -> Void) {
        self.serviceApiImage?.getRequest(with: url, onResponse: { (resultData: Data?) in
            onResponse(resultData)
        })
    }
}
