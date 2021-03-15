//
//  NetworkControllerTests.swift
//
//  Created by Elkin.Salcedo on 3/13/20.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import MeliMarketPlace

class NetworkControllerTests : XCTestCase {
    var network: NetworkController?
    public var expectation: XCTestExpectation!

    override func setUp(){
        network = NetworkController()
    }

    override func tearDown(){
        network = nil
    }

    func testGetRequestWithUrlEmpty(){
        expectation = expectation(description: "onFailure")
        let url = ""
        let header = "application/json"

        network?.getRequest(urlString: url, header: header, onResponse:
        { (dataResponse) in
            XCTAssertEqual(dataResponse.code, 500)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }

    func testGetRequestWithHeaderEmpty(){
        expectation = expectation(description: "onFailure")
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        let header = ""

        network?.getRequest(urlString: url, header: header, onResponse:
        { (dataResponse) in
            XCTAssertEqual(dataResponse.code, 500)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }

    func testGetRequestWithHeaderAndUrlEmpty(){
        expectation = expectation(description: "onFailure")
        let url = ""
        let header = ""

        network?.getRequest(urlString: url, header: header, onResponse:
        { (dataResponse) in
            XCTAssertEqual(dataResponse.code, 500)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }

    func testGetRequestWithUrl(){
        expectation = expectation(description: "OnSuccess")
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        let header =  "application/json"

        network?.getRequest(urlString : url, header: header, onResponse:
        { (dataResponse) in
            XCTAssertNotNil(dataResponse)
            XCTAssertEqual(dataResponse.code, 200)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }

    func testGetRequestWithUrlWrong(){
        expectation = expectation(description: "onFailure")
        let url = "httpsonplaceholder.typicode/todos/1"
        let header =  "application/json"

        network?.getRequest(urlString : url, header: header, onResponse:
        { (dataResponse) in
            XCTAssertNotNil(dataResponse)
            XCTAssertEqual(dataResponse.code, 500)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }

    func testPostRequestWithUrlEmpty(){
        expectation = expectation(description: "onFailure")
        let url = ""
        let header = "application/json"
        let body = "".data(using: .utf8)

        network?.postRequest(urlString: url, header: header, body: body!, onResponse:
        { (dataResponse) in
            XCTAssertEqual(dataResponse.code, 500)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }

    func testPostRequestWithHeaderEmpty(){
        expectation = expectation(description: "onFailure")
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        let header = ""
        let body = "".data(using: .utf8)

        network?.postRequest(urlString: url, header: header, body: body!, onResponse:
        { (dataResponse) in
            XCTAssertEqual(dataResponse.code, 500)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }

    func testPostRequestWithHeaderAndUrlEmpty(){
        expectation = expectation(description: "onFailure")
        let url = ""
        let header = ""
        let body = "".data(using: .utf8)

        network?.postRequest(urlString: url, header: header, body: body!, onResponse:
        { (dataResponse) in
            XCTAssertEqual(dataResponse.code, 500)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }

    func testPostRequestWithUrlWrong(){
        expectation = expectation(description: "onFailure")
        let url = "httpsonplaceholder.typicode/todos/1"
        let header = "application/json"
        let body = "".data(using: .utf8)

        network?.postRequest(urlString: url, header: header, body: body!, onResponse:
        { (dataResponse) in
            XCTAssertNotNil(dataResponse)
            XCTAssertEqual(dataResponse.code, 500)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }

    func testPostRequestWithUrl(){
        expectation = expectation(description: "OnSuccess")
        let url = "http://mockbin.com/request?foo=bar&foo=baz"
        let header =  "application/json"
        let parameters:Dictionary = ["foo": "bar"]
        let body = try! JSONSerialization.data(withJSONObject: parameters, options: .init())

        network?.postRequest(urlString: url, header: header, body: body, onResponse:
        { (dataResponse) in
            XCTAssertNotNil(dataResponse)
            self.expectation.fulfill()
        })

        waitForExpectations(timeout: 20)
    }
}
