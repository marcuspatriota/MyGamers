//
//  ConsoleTableViewCell.swift
//  MyGamers
//
//  Created by Marcus on 26/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class ConsoleTableViewCell: UITableViewCell {

    @IBOutlet weak var iconConsole: UIImageView!
    @IBOutlet weak var titleConsole: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configConsoleCell(_ console: Console){
        titleConsole.text = console.name
        iconConsole?.image = console.icon as? UIImage
    }
}
