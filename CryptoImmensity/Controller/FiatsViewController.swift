//
//  FiatsViewController.swift
//  CryptoImmensity
//
//  Created by miadjalili on 2/1/22.
//

import UIKit
import Nuke
class FiatsViewController: UIViewController {
    private var fiatsModel = Fiats()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose a Fiat"
        tableView.delegate = self
        tableView.dataSource =  self
        tableView.register(UINib(nibName: TableViewCellFiats.name, bundle: nil), forCellReuseIdentifier: TableViewCellFiats.identifier)
        self.getFiats()
        
    }
    
    
    func getFiats(){
        APIClient.GetFiats { result in
            switch result{
            case .success(let Fiats):
                self.fiatsModel = Fiats
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
            print(error)
            }
        }
    }

}

extension FiatsViewController :  UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fiatsModel.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelFiats  = fiatsModel[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellFiats.identifier, for: indexPath) as? TableViewCellFiats else {
            return UITableViewCell()
        }
        let fileUrl = URL(string: modelFiats.imageURL)!
        Nuke.loadImage(with: fileUrl , into: cell.imageFiats)
        cell.nameLabel.text = modelFiats.name
        cell.symbolLabel.text = modelFiats.symbol
        cell.rateLebel.text = "\(String(format:"%.2f",modelFiats.rate ))"
        return cell
    }
    
}

