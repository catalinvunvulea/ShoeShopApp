//
//  BrandVC.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 26/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class BrandCell: UICollectionViewCell {
    
    @IBOutlet weak var brandImage: UIImageView!
    
    
    func updateBrands(brandImg: String) {
        self.brandImage.image = UIImage(named: brandImg)
    }
    
    
}
