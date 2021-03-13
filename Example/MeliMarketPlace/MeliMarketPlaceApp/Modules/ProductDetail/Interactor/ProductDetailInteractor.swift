//
//  ProductListInteractor.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class ProductDetailInteractor: ProductDetailInteractorProtocol {
    weak var presenter: ProductDetailPresenterProtocol!
    var apiService: ApiServiceProtocol!

    func getImage(from url: String, onResponse: @escaping(_ data: Data?) -> Void) {
        self.apiService.getService(with: url, header: APISERVICE_HEADER, onResponse: { (resultData: Data?) in
            onResponse(resultData)
        })
    }
}
