//
//  DetailsCoinViewController.swift
//  CryptoImmensity
//
//  Created by miadjalili on 2/8/22.
//

import UIKit
import Nuke

class DetailsCoinViewController: UIViewController {
    
    var forwardData : Coin?
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    @IBOutlet weak var volumeLabel: UILabel!
    
    @IBOutlet weak var marketCapLabel: UILabel!
    
    @IBOutlet weak var availableSupplyLabel: UILabel!
    
    @IBOutlet weak var totalSupplyLabel: UILabel!
    
    @IBOutlet weak var addtofavoriteBtn: UIButton!
    
    static let identifier = "DetailsCoinViewController"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        setupView()
        addtofavoriteBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func addNavBarImage() {
        let imageView = UIImageView()
        let label = UILabel()
        label.text = forwardData?.name
        label.sizeToFit()
        
        label.textAlignment = NSTextAlignment.center
        let navController = navigationController!
        if let urlImage = URL(string: forwardData!.icon ){
            Nuke.loadImage(with: urlImage, into: self.imageIcon)
        }
        //Your logo url here
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
    
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = label
        
        
    }
    func setupView(){
        nameLabel.text = "\(forwardData!.name)(\(forwardData!.symbol))"
        if forwardData!.price! >= 1.00 {
            priceLabel.text = "$\(String(format:"%.2f",forwardData!.price! ))"
        }else{
            priceLabel.text = "$\(String(format:"%.15f",forwardData!.price! ))"
        }
        rankLabel.text = "#\(forwardData!.rank)"
        volumeLabel.text = "Volume: $\(String(format:"%.0f",forwardData!.volume! ))"
        marketCapLabel.text = "MarketCap:  $\(String(format:"%.0f",forwardData!.marketCap! ))"
        totalSupplyLabel.text = "TotalSupply: \(forwardData!.totalSupply!)"
        availableSupplyLabel.text = "AvailableSupply: \(forwardData!.availableSupply!)"
        
    }
    @objc func buttonTapped ( sender: UIButton){
        if sender.backgroundColor == .clear {
            sender.backgroundColor = .orange
            sender.setTitleColor(.black, for: .normal)
            let alert = UIAlertController(title: "Add to Favorite List", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Add Coin", style: .default) { (action) in
                
            }
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
          print("Add item to coreData")
          
        } else {
            sender.backgroundColor = .clear
            sender.setTitleColor(.orange, for: .normal)
            let alert = UIAlertController(title: "Remove to Favorite List", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Remove Coin", style: .default) { (action) in
                
            }
            alert.addAction(action)
            present(alert,animated: true,completion: nil)
            print("remove item to coreData")
        }
        
        
        
        
        
    }

}
