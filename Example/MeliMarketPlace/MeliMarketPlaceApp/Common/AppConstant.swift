//
//  ServiceConstant.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


// ServiceApi constant
let SERVICEAPI_ENDPOINT = "https://api.mercadolibre.com"
let SERVICEAPI_SEARCH_URI = SERVICEAPI_ENDPOINT + "/sites/MLA/search?q="
let SERVICEAPI_SEARCH_ITEMS_URI = SERVICEAPI_ENDPOINT + "/items?ids="
let SERVICEAPI_HEADER = "application/json"


// Message App Error
let ERROR_SEARCH_EMPTY = "Hey!. Enter whatever product that you want to buy."
let ERROR_GENERAL_MESSAGE = "Opps!. Something went wrong. Try again"
let ERROR_PRODUCTS_NOT_FOUND = "Opps!, we couldn't found products about your search. try again"

// others
let HTTP_PROTOCOL = "http:"
let HTTPS_PROTOCOL = "https:"
let MELI_SERVICEAPI_DEV = "MELI_SERVICEAPI_DEV"
let LOADING_MESSAGE = "Hey!. Almost, please wait."
