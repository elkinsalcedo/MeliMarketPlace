//
//  MockProductHomePresenter.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
@testable import MeliMarketPlace_Example
import XCTest

class MockProductHomePresenter: ProductHomePresenterProtocol {
    var view: ProductHomeViewProtocol?
    var router: ProductHomeRouterProtocol!
    var interactor: ProductHomeInteractorProtocol!

    var calledMethod = ""
    var expectation: XCTestExpectation!

    init(expectation : XCTestExpectation) {
        self.expectation = expectation
    }

    func searchProducts(query: String) {
        expectation.fulfill()
        
        self.calledMethod = "searchProducts"
    }

    func productsFetched(products: Products) {
        expectation.fulfill()

        self.calledMethod = "productsFetched"
    }

    func productsNotFound(with message: String) {
        expectation.fulfill()

        self.calledMethod = "productsNotFound"
    }

}
