//
//  UserPortraitController.swift
//  blt
//
//  Created by Mac on 24/09/2016.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation
import UIKit

class UserPortraitController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1, y: 0.1))
        UIView.animate(withDuration: 1, delay: 0.01, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.view.layer.setAffineTransform(CGAffineTransform(scaleX: 1, y: 1))
            },  completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
