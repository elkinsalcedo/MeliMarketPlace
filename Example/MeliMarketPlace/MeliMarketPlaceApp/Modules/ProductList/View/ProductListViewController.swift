//
//  ProductListViewController.swift
//  MeliMarketPlace_Example
//
//  Created by Elkin.Salcedo on 3/8/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class ProductListViewController: UIViewController, ProductListViewProtocol, UITableViewDelegate, UITableViewDataSource {
    var presenter: ProductListPresenterProtocol!
    var productList: Products?

    @IBOutlet weak var productListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.productList = presenter?.productList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func failedProduct(with message: String) {
        LoadingView.hide()
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList!.results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productItem = self.productList!.results[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as! ProductListViewCell

        cell.productTitle.text = productItem.title
        cell.productPrice.text = String(productItem.price)

        presenter.getImage(from: productItem.thumbnail.replacingOccurrences(of: HTTP_PROTOCOL, with: HTTPS_PROTOCOL), onResponse: {
            (dataResponse) in
            DispatchQueue.main.async{
                cell.thumbnail.image = UIImage(data: dataResponse!)
            }
        })

        LoadingView.hide()

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productItemId = self.productList!.results[indexPath.row].id

        LoadingView.show()
        presenter?.productSelected(itemId: productItemId)
    }
}
