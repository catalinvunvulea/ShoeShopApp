//
//  TestButtonVC.swift
//  Day3 ShoeShop
//
//  Created by Dumitru Catalin Vunvulea on 21/05/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class TestButtonVC: UIViewController {

    var pressed = false
    
    @IBOutlet weak var viewToShow: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuButton = UIButton(type: UIButton.ButtonType.system)
        menuButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        menuButton.addTarget(self, action: #selector(openSearch), for:    .touchUpInside)
        menuButton.setImage(UIImage(named: "icon_search"), for: UIControl.State())
        let menuBarButtonItem = UIBarButtonItem(customView: menuButton)

        navigationItem.leftBarButtonItems = [menuBarButtonItem]

    }
    
    @objc func openSearch() {

    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
       
        if pressed {
            viewToShow.isHidden = pressed
        }
         pressed = !pressed
    }
    
}

extension UIViewController {
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }

        // make sure this isn't a subclass
        if self !== UIViewController.self {
            return
        }

        dispatch_once(&Static.token) {
            let originalSelector = Selector("viewWillAppear:")
            let swizzledSelector = Selector("extended_viewWillAppear:")

            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)

            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))

            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
    }

    // MARK: - Method Swizzling

    func extended_viewWillAppear(animated: Bool) {
        self.extended_viewWillAppear(animated)

        // Call your code here that you want to run for all view controllers, table view controllers, tab view controllers etc...
    }
}
