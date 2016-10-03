//
//  WritingController.swift
//  blt
//
//  Created by Mac on 23/09/2016.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation
import UIKit

class WritingController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(writeCancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "确定", style: .plain, target: self, action: #selector(writeOver))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func writeOver() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func writeCancel() {
        self.dismiss(animated: true, completion: nil)
    }
}
