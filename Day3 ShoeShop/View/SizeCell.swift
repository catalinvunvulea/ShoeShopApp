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
    @IBOutlet weak var sizeCellView: UIView!
    
    
    
    func updateSize(size: String, stock: Int, selectedCell: String, indexCell: String) {
        self.sizeLbl.text = size
        sizeCellView.layer.cornerRadius = 10
        if stock == 0 {
            sizeCellView.alpha = 0.5
            sizeCellView.backgroundColor = .lightGray
            self.sizeLbl.textColor = .black
        } else if selectedCell == indexCell {
            sizeCellView.backgroundColor = .black
            self.sizeLbl.textColor = .white
            sizeCellView.alpha = 1
        } else {
            sizeCellView.backgroundColor = .lightGray
            self.sizeLbl.textColor = .black
            sizeCellView.alpha = 1
        }
        
    }
    
    
    
    
}
