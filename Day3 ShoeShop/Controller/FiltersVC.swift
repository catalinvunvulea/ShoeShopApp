//
//  FiltersVC.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 22/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class FiltersVC: UIViewController {
    
    @IBOutlet weak var filtrsLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var minPriceView: UIView!
    @IBOutlet weak var maxPriceView: UIView!
    @IBOutlet weak var adjustableView: UIView!
    
    @IBOutlet weak var minPriceLbl: UILabel!
    @IBOutlet weak var maxPriceLbl: UILabel!
    
    
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var colorLbl: UILabel!
    
    
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brandCollectionView.dataSource = self
        brandCollectionView.delegate = self
        colorCollectionView.dataSource = self
        colorCollectionView.delegate = self
    
        
        colorCollectionView.tag = 1
        
        colorCollectionView.tag = 1
        minPriceView.layer.cornerRadius = minPriceView.frame.height / 2
        maxPriceView.layer.cornerRadius = maxPriceView.frame.height / 2
       
    }
    
    
}

extension FiltersVC: UICollectionViewDelegate {
    
}

extension FiltersVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
    
}

extension FiltersVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return DataService.instance.brands.count
        } else {
            return DataService.instance.colors.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{
            guard let brandCell = brandCollectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as? BrandCell else { return UICollectionViewCell() }
            brandCell.updateBrands(brandImg: DataService.instance.brands[indexPath.item])
            if brandCell.isSelected {
                brandCell.brandImage.layer.borderWidth = 2
                brandCell.brandImage.layer.borderColor = UIColor.black.cgColor
            } else {
                brandCell.brandImage.layer.borderWidth = 0
            }
            return brandCell
            
        } else {
            guard let colorCell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCell else { return UICollectionViewCell() }
            colorCell.updateColorCell(color: DataService.instance.colors[indexPath.item])
            return colorCell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as! BrandCell
          
        } else {
            
        }
    }
    
    
}
