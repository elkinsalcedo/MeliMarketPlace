//
//  ProductHomeIntercatorTests.swift
//  MeliMarketPlace_Tests
//
//  Created by Elkin.Salcedo on 3/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import MeliMarketPlace_Example

class ProductHomeIntercatorTests: XCTestCase {

    var mockView: MockProductHomeViewController?
    var mockRouter: MockProductHomeRouter?
    var mockPresenter: MockProductHomePresenter?
    var mockInteractor: MockProductHomeInteractor?
    var serviceApi: ServiceApiProtocol!
    var expectation: XCTestExpectation!
    var timeExpectation: Double!
    var interactor: ProductHomeInteractor?

    override func setUp() {
        expectation = expectation(description: "ProductsInteractor")
        self.timeExpectation = 5
        self.interactor = ProductHomeInteractor()
        self.mockPresenter = MockProductHomePresenter(expectation: expectation)
        interactor?.presenter = mockPresenter
        super.setUp()
    }

    override func tearDown() {
        self.mockPresenter = nil
        self.timeExpectation = 0
        self.interactor = nil

        super.tearDown()
    }

    func test_SearchProducts_With_Url_And_EmptyQuery_Then_Return_ProductNotFound() {
        interactor?.serviceApi = MeliServiceApi(with: SERVICEAPI_SEARCH_URI, header: SERVICEAPI_HEADER)
        
        interactor?.searchProducts(query: "")

        waitForExpectations(timeout: timeExpectation)
        XCTAssertEqual(mockPresenter?.calledMethod, "productsNotFound")
    }

    func test_SearchProducts_With_InvalidUrl_And_Query_Then_Return_ProductNotFound() {
        interactor?.serviceApi = MeliServiceApi(with: "invalidUrl", header: SERVICEAPI_HEADER)

        interactor?.searchProducts(query: "camisas")

        waitForExpectations(timeout: timeExpectation)
        XCTAssertEqual(mockPresenter?.calledMethod, "productsNotFound")
    }

    func test_SearchProducts_With_Url_And_Querynotfound_Then_Return_ProductNotFound() {
        interactor?.serviceApi = MeliServiceApi(with: SERVICEAPI_SEARCH_URI, header: SERVICEAPI_HEADER)

        interactor?.searchProducts(query: "notfound")

        waitForExpectations(timeout: timeExpectation)
        XCTAssertEqual(mockPresenter?.calledMethod, "productsNotFound")
    }

    func test_SearchProducts_With_Url_And_Query_Then_Return_ProductsFetched() {
        interactor?.serviceApi = MeliServiceApi(with: SERVICEAPI_SEARCH_URI, header: SERVICEAPI_HEADER)

        interactor?.searchProducts(query: "camisas")

        waitForExpectations(timeout: 5)
        XCTAssertEqual(mockPresenter?.calledMethod, "productsFetched")
    }

}
