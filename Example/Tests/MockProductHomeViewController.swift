//
//  MockProductHomeViewController.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class MockProductHomeViewController: ProductHomeViewProtocol {
    var presenter: ProductHomePresenterProtocol!
    var calledMethod = ""

    func showMessageOnScreen(msg: String) {
        self.calledMethod = "showMessageOnScreen"
    }
}
