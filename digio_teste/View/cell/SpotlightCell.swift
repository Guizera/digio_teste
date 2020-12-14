//
//  SpotlightCell.swift
//  digio-teste
//
//  Created by José Alves da Cunha on 13/12/20.
//

import UIKit
import Kingfisher

class SpotlightCell: UICollectionViewCell {

    @IBOutlet weak var imageSpotlight: UIImageView!
    @IBOutlet weak var viewImageSpotilight: UIView!
    static let CellIdentifier = "SpotilightCellIdentifier"
    
    func displayCell(spotlight: Spotlight) {
        
        let url = URL(string: spotlight.bannerURL)
        imageSpotlight.kf.setImage(with: url)
        
        self.viewImageSpotilight.layer.cornerRadius = 10
       
    }
}
