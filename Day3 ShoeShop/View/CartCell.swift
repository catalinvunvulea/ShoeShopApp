//
//  CartCell.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 20/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var imageViewHolder: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    
    @IBOutlet weak var quantityLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCartCell(product: Product) {
        self.imageViewHolder.layer.cornerRadius = 20
        self.productImage.image = UIImage(named: product.imageName)
        self.productNameLbl.text = product.productName
        self.productPriceLbl.text = "£\(product.price)"
        self.quantityLbl.text = "x1" //to do: add the qty
    }

}
