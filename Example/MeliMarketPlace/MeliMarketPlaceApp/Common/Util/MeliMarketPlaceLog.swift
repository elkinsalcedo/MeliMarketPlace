//
//  MeliMarketPlaceLog.swift
//
//  Created by Elkin.Salcedo on 3/13/21.
//

import Foundation

@objcMembers
public class MeliMarketPlaceLog {

    static func dLog(message: String, function: String = #function) {
        #if DEBUG
          print("MELI_MAKERTPLACE-DEBUG-\(function): \(message)")
        #endif
    }
}
