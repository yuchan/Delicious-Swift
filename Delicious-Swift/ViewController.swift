//
//  ViewController.swift
//  Delicious-Swift
//
//  Created by Yusuke Ohashi on 3/12/15.
//  Copyright (c) 2015 Yusuke Ohashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DeliciousClient.setup("YOUR CLIENT ID", client_secret: "YOUR CLIENT SECRET")
        let cli: DeliciousClient = DeliciousClient.sharedInstance
        cli.sayHello()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

