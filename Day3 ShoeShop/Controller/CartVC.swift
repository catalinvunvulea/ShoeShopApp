//
//  CartVC.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 20/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class CartVC: UIViewController {
    
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var numberOfItemsInCartBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var totalValueLbl: UILabel!
    @IBOutlet weak var checkOutBtn: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        checkOutBtn.layer.cornerRadius = checkOutBtn.frame.height / 2
        totalLbl.layer.cornerRadius = totalLbl.frame.height / 2
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        numberOfItemsInCartBtn.setTitle("\(DataService.instance.cart.count)", for: .normal)
        
    }
    
    @IBAction func checkOutBtnPressed(_ sender: Any) {
    }
    
}

extension CartVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartCell else { return UITableViewCell() }
        cell.updateCartCell(product: DataService.instance.cart[indexPath.row])
        
        return cell
    }
    
    
    
}

extension CartVC: UITableViewDelegate {
    
}
