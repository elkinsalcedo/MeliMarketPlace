//
//  ProductHomePresenterTests.swift
//  MeliMarketPlace_Tests
//
//  Created by Elkin.Salcedo on 3/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import MeliMarketPlace_Example

class ProductHomePresenterTests: XCTestCase {

    var mockView: MockProductHomeViewController?
    var mockInteractor: MockProductHomeInteractor?
    var presenter: ProductHomePresenterProtocol?
    var mockRouter: MockProductHomeRouter?
    var interactor: ProductHomeInteractor?

    var expectation: XCTestExpectation!
    var timeExpectation: Double!

    
    override func setUp() {
        self.presenter = ProductHomePresenter()
        self.mockInteractor = MockProductHomeInteractor()
        self.mockRouter = MockProductHomeRouter()
        self.mockInteractor?.presenter = presenter
        self.presenter?.router = mockRouter
        self.presenter?.interactor = mockInteractor
        super.setUp()
    }

    override func tearDown() {
        self.mockInteractor = nil
        self.presenter = nil
        self.mockView = nil

        super.tearDown()
    }

    func test_SearchProducts_With_Query_Then_Return_SearchProducts() {
        presenter?.searchProducts(query: "camisas")

        XCTAssertEqual(mockInteractor?.calledMethod, "searchProducts")
    }

    func test_SearchProducts_With_Query_NotFound_Then_Return_ShowMessageOnScreen() {
        mockInteractor?.calledMethod = "ProductsNotFound"
        mockView = MockProductHomeViewController()
        presenter?.view = mockView

        presenter?.searchProducts(query: "notfound")

        XCTAssertEqual(mockView?.calledMethod, "showMessageOnScreen")
    }

    func test_SearchProducts_With_Query_Then_Return_PushToProductListScreen() {
        mockInteractor?.calledMethod = "ProductsFetched"

        presenter?.searchProducts(query: "camisas")

        XCTAssertEqual(mockRouter?.calledMethod, "pushToProductListScreen")
    }

}
