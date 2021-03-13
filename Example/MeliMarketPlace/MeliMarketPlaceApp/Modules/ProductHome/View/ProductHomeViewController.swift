//
//  ProductHomeViewController.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class ProductHomeViewController: UIViewController, ProductHomeViewProtocol {
    var presenter: ProductHomePresenterProtocol!

    @IBOutlet weak var txtSearchProducts: UITextField!
    @IBOutlet weak var lblErrorMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        ProductHomeRouter.createModule(view: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clickBtnSearchProducts(_ sender: Any) {
       // navigationController?.pushViewController(ProductListViewController(), animated: true)
        self.presenter?.searchProducts(query: txtSearchProducts.text!)
    }

    func showMessageOnScreen(msg: String) {
        self.lblErrorMessage.text = msg
    }

}
