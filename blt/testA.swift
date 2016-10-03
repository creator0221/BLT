//
//  testA.swift
//  blt
//
//  Created by Mac on 23/09/2016.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation
import UIKit

class testA: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ppp(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "ttt", sender: self)
    }
    
}
