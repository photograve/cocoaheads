//
//  ViewController.swift
//  cocoaheads
//
//  Created by Gabriel Bremond on 30/08/16.
//  Copyright © 2016 photograve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var header: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        header.text = NSLocalizedString("Hello!", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

