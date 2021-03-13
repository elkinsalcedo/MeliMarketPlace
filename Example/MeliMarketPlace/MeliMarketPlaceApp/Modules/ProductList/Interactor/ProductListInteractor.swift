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
    var apiService: ApiServiceProtocol!

    func getProductDetail(itemId: String) {
        self.apiService?.getDataDetail(with: itemId, onResponse: { (resultData: Data?) in
            DispatchQueue.main.async {
                do {
                    let productItem = try JSONDecoder()
                        .decode([DataDecodable<ProductItem>].self, from: resultData!)
                        .compactMap { $0.base }

                    self.presenter.productFetched(product: productItem[0])
                } catch {
                    self.presenter.failedProduct(with: ERROR_GENERAL_MESSAGE)
                }
            }
        })
    }

    func getImage(from url: String, onResponse: @escaping(_ data: Data?) -> Void) {
        self.apiService.getService(with: url, header: APISERVICE_HEADER, onResponse: { (resultData: Data?) in
            onResponse(resultData)
        })
    }
}
