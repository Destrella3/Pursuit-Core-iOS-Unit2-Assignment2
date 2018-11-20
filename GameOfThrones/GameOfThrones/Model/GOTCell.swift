//
//  GOTCell.swift
//  GameOfThrones
//
//  Created by Diego Estrella III on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTCell: UITableViewCell {

    @IBOutlet weak var gotImage: UIImageView!
    @IBOutlet weak var gotName: UILabel!
    @IBOutlet weak var gotSeasonAndEpisode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
