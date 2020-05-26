//
//  ColorCell.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 26/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    
    
    func updateColorCell(color: UIColor) {
        self.colorView.layer.cornerRadius = 15
        self.colorView.backgroundColor = color
    }
    
}
