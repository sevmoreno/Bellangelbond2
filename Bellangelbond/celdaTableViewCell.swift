//
//  celdaTableViewCell.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/15/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit

class celdaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contenedor: UIView!
    
    @IBOutlet weak var homeTitle: UILabel!
    @IBOutlet weak var homeSubtitle: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contenedor.backgroundColor = UIColor(hue: 0.6778, saturation: 1, brightness: 0.27, alpha: 1.0)
      //  contenedor.alpha = 0.50
        contenedor.layer.cornerRadius = 10
       /*
        contenedor.layer.shadowColor = UIColor.black.cgColor
        contenedor.layer.shadowOpacity = 1
        contenedor.layer.shadowOffset = .zero
        contenedor.layer.shadowRadius = 30
        contenedor.layer.shadowPath = UIBezierPath(rect: contenedor.bounds).cgPath
        contenedor.layer.shouldRasterize = true
        contenedor.layer.rasterizationScale = UIScreen.main.scale
 */
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
