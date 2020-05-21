//
//  SettingsVC.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 21/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var cartBtn: UIButton!
    
    
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var newInLbl: UILabel!
    @IBOutlet weak var saleLbl: UILabel!
    @IBOutlet weak var profileLbl: UILabel!
    
    
    @IBOutlet weak var sezonalCollectionBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sezonalCollectionBtn.layer.cornerRadius = 15
        cartBtn.layer.contents = cartBtn.frame.height / 2
        cartBtn.setTitle("\(DataService.instance.cart.count)", for: .normal)
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func searchBtnPressed(_ sender: Any) {
    }
    
    @IBAction func filterBtnPressed(_ sender: Any) {
    }
    
    @IBAction func cartBtnPressed(_ sender: Any) {
        guard let cartVC = storyboard?.instantiateViewController(identifier: "CartVC") as? CartVC else {return}
        cartVC.modalPresentationStyle = .fullScreen
        present(cartVC, animated: true, completion: nil)
        
    }
    
    
}
