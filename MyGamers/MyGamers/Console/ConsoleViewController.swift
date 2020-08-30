//
//  ConsoleViewController.swift
//  MyGamers
//
//  Created by Marcus on 26/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class ConsoleViewController: UIViewController {
    
    var console: Console!

    @IBOutlet weak var titleConsole: UILabel!
    @IBOutlet weak var imgConsole: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleConsole.text = console?.name
        

    }
    

  

}
