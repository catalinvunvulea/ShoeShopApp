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
        minPriceView.layer.cornerRadius = minPriceView.frame.height / 2
        maxPriceView.layer.cornerRadius = maxPriceView.frame.height / 2
       
    }
    
}

extension FiltersVC: UICollectionViewDelegate {
    
}

extension FiltersVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //to add the cells
        return UICollectionViewCell()
    }
    
    
}
