//
//  ProductCell.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 18/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
  
    
    
    
    func updateProductsPP(image: String) {
        self.productImg.image = UIImage(named: image)
        self.contentView.layer.cornerRadius = 20
    }
    
}
