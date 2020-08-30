//
//  GameViewController.swift
//  MyGamers
//
//  Created by Marcus on 25/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbConsole: UILabel!
    @IBOutlet weak var lbReleaseDate: UILabel!
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var imgConsole: UIImageView!
    
    var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = game.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        lbTitle.text = game.title
        lbConsole.text = game.console?.name
        imgConsole.image = game.console?.icon as? UIImage
        if let releaseDate = game.releaseDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.locale = Locale(identifier: "pt-BR")
            lbReleaseDate.text = "Lançamento: " + formatter.string(from: releaseDate)
        }
       
        if let image = game.cover as? UIImage {
            ivCover.image = image
        } else {
            ivCover.image = UIImage(named: "noCoverFull")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let vc = segue.destination as! AddEditViewController
           vc.game = game
       }

}
