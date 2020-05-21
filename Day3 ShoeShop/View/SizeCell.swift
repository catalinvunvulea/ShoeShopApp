//
//  SizeCell.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 18/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class SizeCell: UICollectionViewCell {
    
    @IBOutlet weak var sizeLbl: UILabel!
    
    
    func updateSize(size: String, stock: Int, selectedCell: String, indexCell: String) {
        self.sizeLbl.text = size
        contentView.layer.cornerRadius = 10
        if stock == 0 {
            contentView.alpha = 0.5
            contentView.backgroundColor = .lightGray
            self.sizeLbl.textColor = .black
        } else if selectedCell == indexCell {
            contentView.backgroundColor = .black
            self.sizeLbl.textColor = .white
            contentView.alpha = 1
        } else {
            contentView.backgroundColor = .lightGray
            self.sizeLbl.textColor = .black
            contentView.alpha = 1
        }
        
    }
    
    
    
    
}
