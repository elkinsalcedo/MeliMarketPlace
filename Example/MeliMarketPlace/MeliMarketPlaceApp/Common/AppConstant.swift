//
//  ServiceConstant.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


// ApiService constant
let APISERVICE_ENDPOINT = "https://api.mercadolibre.com"
let APISERVICE_SEARCH_URI = APISERVICE_ENDPOINT + "/sites/MLA/search?q="
let APISERVICE_SEARCH_ITEMS_URI = APISERVICE_ENDPOINT + "/items?ids="
let APISERVICE_HEADER = "application/json"


// Message App Error

let ERROR_GENERAL_MESSAGE = "Opps!. Something went wrong. Try again"
let ERROR_PRODUCTS_NOT_FOUND = "Opps!, we couldn't found products about your search. try again"
