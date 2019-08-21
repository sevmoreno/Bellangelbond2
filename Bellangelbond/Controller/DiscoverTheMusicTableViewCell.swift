//
//  DiscoverTheMusicTableViewCell.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/20/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit

class DiscoverTheMusicTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var subTitulo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
