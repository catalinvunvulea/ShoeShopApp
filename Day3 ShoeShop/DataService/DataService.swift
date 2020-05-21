//
//  DataService.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 03/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import Foundation


class DataService {
    static let instance = DataService()
    
    
    var products: [Product] = []
    var favorites: [Product] = []
    var cart: [Product] = []

    private init() {
        getProductsFromDB()
    }
    
    func addToCart(product: Product) {
        cart.append(product)
    }
    
    func removeFromCart(index: Int) {
        cart.remove(at: index)
    }
    
    func checkout() {
        cart.removeAll()
    }
    
    func getProductsFromDB() { // simulate server
        products = [
            Product(imageName: "270.jpg", productName: "Nike AirMax 270 react", price: 270.99, stockSize: [0: ["XS": 0], 1: ["S": 0], 2: ["M": 2], 3: ["X": 5], 4: ["XL": 1]], additionalImages: ["270.jpg", "271.jpg"], liked: false, id: "0"),
            Product(imageName: "272.jpg", productName: "Nike Air Max 97", price: 299.99, stockSize: [0: ["XS": 1], 1: ["S": 1], 2: ["M": 0], 3: ["X": 0], 4: ["XL": 1]], additionalImages: ["272.jpg", "270.jpg"], liked: false, id: "1"),
            Product(imageName: "271.jpg", productName: "Air Max future", price: 301.59, stockSize: [0: ["XS": 0], 1: ["S": 0], 2: ["M": 0], 3: ["X": 0], 4: ["XL": 1]], additionalImages: ["271.jpg", "270.jpg", "271.jpg", "270.jpg"], liked: false, id: "2")
        ]
    }
    
    func updateFavorites(product: Product) {
        for p in products {
            if p.id == product.id {
                p.liked = !p.liked

            }
        }
      
    }
    
    
}
