//
//  ProductCell.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 03/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit


class HomeProductCell: UITableViewCell {
    
    var productById = false
    var product: Product!
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    
    
    @IBAction func likeBtnPressed(_ sender: Any) {
        DataService.instance.updateFavorites(product: product)
        if product.liked {
            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 10, right: 0))
        
    }
    
    
    func updateProducts(product: Product) {
        productImage.image = UIImage(named: product.imageName)
        productName.text = product.productName
        productPrice.text = "£ \(product.price)"
        if product.liked {
            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        self.product = product
        
    }
    
    
}
