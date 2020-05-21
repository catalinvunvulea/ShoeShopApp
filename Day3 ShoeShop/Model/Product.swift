//
//  Product.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 03/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import Foundation

class Product {
    
    var imageName: String
    var productName: String
    var price: Double
    var stockSize: [Int: [String:Int]]
    var additionalImages: [String]
    var liked: Bool
    var id: String
    
    init(imageName: String, productName: String, price: Double, stockSize: [Int: [String:Int]], additionalImages: [String], liked: Bool, id: String) {
        self.imageName = imageName
        self.productName = productName
        self.price = price
        self.stockSize = stockSize
        self.additionalImages = additionalImages
        self.liked = liked
        self.id = id
    }
    
}

