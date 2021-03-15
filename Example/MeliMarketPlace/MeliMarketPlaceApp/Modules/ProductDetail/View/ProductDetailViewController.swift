//
//  ProductDetailViewController.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailViewController: UIViewController, ProductDetailViewProtocol {
    var presenter: ProductDetailPresenterProtocol!
    var product: Product!

    @IBOutlet weak var productTile: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.product = presenter.productItemId.body
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnBuynow(_ sender: Any) {
        self.presenter.buyNow()
    }

    func setupView(){
        self.productTile.text = self.product.title
        self.productPrice.text = String(format: "$%.1f", self.product.price)

        self.presenter.getImage(from: self.product.thumbnail.replacingOccurrences(of: HTTP_PROTOCOL, with: HTTPS_PROTOCOL), onResponse: {
            (dataResponse) in
            DispatchQueue.main.async() { [weak self] in
                self?.productImage.image = UIImage(data: dataResponse!)
                LoadingView.hide()
            }
        })
    }
}
