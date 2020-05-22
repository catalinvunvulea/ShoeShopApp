//
//  ViewController.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 03/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var sortByBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        cartBtn.layer.cornerRadius = cartBtn.frame.height / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        products = DataService.instance.products
        cartBtn.setTitle("\(DataService.instance.cart.count)", for: .normal)
        tableView.reloadData()
    }
    
    @IBAction func cartbtnPressed(_ sender: Any) {
        guard let cartVC = storyboard?.instantiateViewController(identifier: "CartVC") as? CartVC else { return }
        cartVC.modalPresentationStyle = .fullScreen
        present(cartVC, animated: true, completion: nil)
    }
    
    
    @IBAction func filterBtnPressed(_ sender: Any) {
        guard let filterVC = storyboard?.instantiateViewController(identifier: "FiltersVC") as? FiltersVC else {return}
        present(filterVC, animated: true, completion: nil)
    }
    
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        guard let menuVC = storyboard?.instantiateViewController(identifier: "MenuVC") as? MenuVC else { return }
        menuVC.modalPresentationStyle = .fullScreen
        present(menuVC, animated: true, completion: nil)
    }
    
    
}



extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeProductCell") as? HomeProductCell {
            let product = products[indexPath.row]
            cell.updateProducts(product: product)
            cell.productById = products[indexPath.row].liked
            cell.contentView.layer.cornerRadius = 20
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
   
    
}

extension MainVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let productPage = storyboard?.instantiateViewController(identifier: "ProductPageVC") as? ProductPageVC else { return }
        productPage.product = self.products[indexPath.row]
        productPage.modalPresentationStyle = .fullScreen
        self.present(productPage, animated: true, completion: nil)
        
        
    }
    
}
