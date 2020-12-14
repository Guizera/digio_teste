//
//  ProductsCell.swift
//  digio-teste
//
//  Created by José Alves da Cunha on 13/12/20.
//

import UIKit
import Kingfisher

class ProductsCell: UICollectionViewCell {
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var viewImageProduct: UIView!
    static let CellIdentifier = "ProductsCellIdentifier"
    
    
    func displayCell(product: Product) {
        let url = URL(string: product.imageURL)
        imageProduct?.kf.setImage(with: url)
        
        self.viewImageProduct.layer.cornerRadius = 10
        
    }
}
