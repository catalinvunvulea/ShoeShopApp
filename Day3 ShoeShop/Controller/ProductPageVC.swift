//
//  ProductPageVC.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 18/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class ProductPageVC: UIViewController {
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var sizeGuideBtn: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var likebtnView: UIView!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    @IBOutlet weak var upperSideView: UIView!
    
    @IBOutlet weak var productPageController: UIPageControl!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    
    var product: Product!
    var productImages: [String] = []
    var productSizes: [Int: [String: Int]] = [:]
    var selectedSizeCell = ""
    
   
    var stockArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        sizeCollectionView.delegate = self
        sizeCollectionView.dataSource = self
        
        
        upperSideView.layer.cornerRadius = 20
        likebtnView.layer.borderWidth = 0.9
        likebtnView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        likebtnView.layer.cornerRadius = 10
        addToCartBtn.layer.cornerRadius = addToCartBtn.frame.height / 2
        addToCartBtn.backgroundColor = .black
        productNameLbl.text = product.productName
        productPriceLbl.text = "£\(product.price)"
        if product.liked {
            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        productImages = product.additionalImages
        productSizes = product.stockSize
        for (_, value) in productSizes {
            for (_, value) in value {
                stockArray.append(value)
            }
        }
        addToCartBtn.isEnabled = false
        
        productNameLbl.adjustsFontSizeToFitWidth = true
        productPriceLbl.adjustsFontSizeToFitWidth = true
        
        
    }
    
    @IBAction func sizeGuideBtnPressed(_ sender: Any) {
        print("size guide btn pressed")
    }
    @IBAction func moreBtnPressed(_ sender: Any) {
        print("more btn pressed")
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func likeBtnPressed(_ sender: Any) {
        DataService.instance.updateFavorites(product: product)
        if product.liked {
            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
     
    }
    
    @IBAction func addToCartBtnPressed(_ sender: Any) {
        DataService.instance.addToCart(product: product)
    }
}

extension ProductPageVC: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            guard sizeCollectionView.dequeueReusableCell(withReuseIdentifier: "SizeCell", for: indexPath) is SizeCell else { return }
            selectedSizeCell = "\(indexPath.row)"
            sizeCollectionView.reloadData()
            var stock = 0
            let product = productSizes[indexPath.row]!
            for (_, value) in product {
                stock = value
            }
            if stock > 0 {
                self.addToCartBtn.alpha = 1
                self.addToCartBtn.isEnabled = true
            } else {
                self.addToCartBtn.alpha = 0.5
                self.addToCartBtn.isEnabled = false
            }
            
            
        } else {
            productCollectionView.reloadData()
        }
    }
}

extension ProductPageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            self.productPageController.numberOfPages = productImages.count
            return productImages.count
        } else {
            return productSizes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            
            guard let productCell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else {return UICollectionViewCell()}
            let image = productImages[indexPath.item]
            productCell.updateProductsPP(image: image)
            return productCell
        } else {
            guard let sizeCell = sizeCollectionView.dequeueReusableCell(withReuseIdentifier: "SizeCell", for: indexPath) as? SizeCell else {return UICollectionViewCell()}
            var size = ""
            var stock = 0
            for (key, value) in  productSizes[indexPath.row]! {
                size = key
                stock = value
            }
            sizeCell.updateSize(size: size, stock: stock, selectedCell: selectedSizeCell, indexCell: "\(indexPath.item)")
            return sizeCell
        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x // show how far are we from x margin
        productPageController.currentPage = Int(x / view.frame.width) // we are deviding the size of x to the farem width; on the first screen result will be 1 (as x = frame), on the second will be 2 (as x is twice the frame width, as we are on the second screen) which will show the second  dot on the pageControl
        
        
    }
    
    
}

extension ProductPageVC: UICollectionViewDelegateFlowLayout {
    
    //set size for each cell
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
            let width = self.view.frame.width * 0.95
            let height = self.productCollectionView.frame.height
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: 70, height: 70)
            
        }
    }
    
    //set distance between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    //set constrains for cell first and last cell to view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
}
