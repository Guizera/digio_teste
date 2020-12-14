//
//  HomeViewController.swift
//  digio-teste
//
//  Created by José Alves da Cunha on 09/12/20.
//

import UIKit
import Kingfisher

protocol HomeViewControllerDelegate {
    
    func loadingCollections()
    func showError(message: String)
}


class HomeViewController: UIViewController {
    
    @IBOutlet weak private var spotlightCollection: UICollectionView!
    @IBOutlet weak private var productsCollection: UICollectionView!
    var homeView : HomeView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cashImage: UIImageView!
    
    
    let service = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView = HomeView(self)
        self.homeView.viewDidLoad()
        self.header()
        self.spotlightBlock()
        self.productsBlock()
        
        
        
        //service.getRequest()
    }
    private func header() {
        titleLabel.text = self.homeView.welcome
    }
    private func cashBlock() {
        let imageView = self.homeView.cash?.bannerURL
        print(imageView)
        let url = URL(string: imageView ?? "")
        cashImage.kf.setImage(with: url)
    }
    
    private func spotlightBlock() {
        
        if let layout = spotlightCollection.collectionViewLayout as? UICollectionViewFlowLayout {
        layout.estimatedItemSize = CGSize(width: 0, height: 0)
        }
        
        
    }
    
    private func productsBlock() {
        
        if let layout = productsCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: 100, height: 100)
        }
        
        
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    
    func showError(message: String) {
        
    }
    
    
    func loadingCollections() {
        spotlightCollection?.reloadData()
        productsCollection?.reloadData()
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.isEqual(spotlightCollection) {
            
            return self.homeView.spotlight.count
           
        } else {
            return self.homeView.products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.isEqual(productsCollection) {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.CellIdentifier, for: indexPath) as? ProductsCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCell.CellIdentifier, for: indexPath) as? SpotlightCell else {
                return UICollectionViewCell()
            }
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let cell = cell as? ProductsCell {
            
            let product = self.homeView.products[indexPath.row]
            cell.displayCell(product: product)
        } else if let cell = cell as? SpotlightCell {
            let spotlight = self.homeView.spotlight[indexPath.row]
            cell.displayCell(spotlight: spotlight)
        }
    }
    
    
}
