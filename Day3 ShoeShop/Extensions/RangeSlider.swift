//
//  RangeSlider.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 26/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import Foundation
import UIKit


class SliderViewController: UIViewController {
    
      let rangeSlider = RangeSlider(frame: .zero)
      
      override func viewDidLoad() {
        super.viewDidLoad()
        
        rangeSlider.backgroundColor = .red
        view.addSubview(rangeSlider)
      }
      
      override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20
        let width = view.bounds.width - 2 * margin
        let height: CGFloat = 30
        
        rangeSlider.frame = CGRect(x: 0, y: 0,
                                   width: width, height: height)
        rangeSlider.center = view.center
      }
    
}
