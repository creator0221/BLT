//
//  ViewController.swift
//  blt
//
//  Created by Mac on 9/17/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class ViewController: UITableViewController//UIViewController, UITableViewDelegate
{

//    @IBOutlet var uiTableView: UITableView!
//    @IBOutlet var cell: UITableViewCell!
//    let array = ["123", "456", "789", "012", "345"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.uiTableView!.delegate = self
//        self.uiTableView!.dataSource = self
//        self.uiTableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.title = "添加任务"
        //去除尾部多余的空行
        self.tableView.tableFooterView = UIView(frame:CGRect(x: 0, y: 0, width: 0, height: 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return array.count
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftCell", for: indexPath)
//        
//        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
//        cell.textLabel?.text = self.array[indexPath.row]
//        
//        return cell
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 2
        }
    }
}
