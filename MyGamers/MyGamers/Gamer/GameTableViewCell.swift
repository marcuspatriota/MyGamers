//
//  GameTableViewCell.swift
//  MyGamers
//
//  Created by Marcus on 25/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit
import CoreData

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbConsole: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with game: Game) {
        
       lbTitle.text = game.title ?? ""
       lbConsole.text = game.console?.name ?? ""
       if let image = game.cover as? UIImage {
           ivCover.image = image
       } else {
           ivCover.image = UIImage(named: "noCover")
       }
    }
    

}
