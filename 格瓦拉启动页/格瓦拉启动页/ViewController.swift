//
//  ViewController.swift
//  格瓦拉启动页
//
//  Created by DoubleMint on 2018/1/23.
//  Copyright © 2018年 王保霖. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var popButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func popClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

