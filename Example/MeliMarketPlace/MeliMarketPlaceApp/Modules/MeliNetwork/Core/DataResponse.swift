//
//  DataResponse.swift
//
//  Created by Elkin Salcedo on 3/13/21.
//

import Foundation

@objcMembers
public class DataResponse: NSObject {
    public var code: Int = 500
    public var data: Data = Data()
}
