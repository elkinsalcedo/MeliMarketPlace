//
//  NetworkControllerProtocol.swift
//
//  Created by Elkin Salcedo on 3/13/21.
//

import Foundation

@objc public protocol NetworkControllerProtocol {
    func getRequest(urlString: String, header: String, onResponse: @escaping(DataResponse) -> Void)
    func postRequest(urlString: String, header: String, body: Data, onResponse: @escaping(DataResponse) -> Void)
}
