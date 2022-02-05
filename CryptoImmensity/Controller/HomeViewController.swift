//
//  ViewController.swift
//  CryptoImmensity
//
//  Created by miadjalili on 12/10/21.
//

import UIKit
import Nuke

class HomeViewController: UIViewController {
    
    private var CoinsModel : [Coin] = [Coin]()
    private var currency = "$"
    var refreshControl = UIRefreshControl()
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    
    
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(UINib(nibName: TableViewCellHome.name, bundle: nil), forCellReuseIdentifier: TableViewCellHome.identifier)
        self.fetchData()
        self.refreshTableview()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "ff", style: .plain, target: self, action: #selector(handelarSerchCoins))
       
    }
    
    @objc func handelarSerchCoins(){
        updateSearchResults(for: searchController)
     
     }
    
    func fetchData(currency:String = "USD" , limit:String = "1000"){
        APIClient.GetCoins(currency: currency,limit : limit) { result in
            switch result {
            case .success(let Coins):
                print(Coins.coins)
                self.CoinsModel = Coins.coins
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("ERRor")
                print(error)
            }
        }
    }
    
    func refreshTableview(){
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = self.refreshControl
            
        } else {
            self.tableView.addSubview(self.refreshControl)
            
        }
        self.refreshControl.addTarget(self, action: #selector(self.refreshWeatherData(_:)), for: .valueChanged)
    }
    
    
    func getMarket(coinId:String = "bitcoin"){
        APIClient.GetMarket(coinID: coinId) { result in
            switch result{
            case .success(let Market):
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
            print(error)
            }
        }
    }

}



extension HomeViewController : UITableViewDelegate,UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoinsModel.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelCoins  = CoinsModel[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellHome.identifier, for: indexPath) as? TableViewCellHome else {
            return UITableViewCell()
        }
        cell.rankLabel.text = "\(modelCoins.rank)"
        cell.coinNameLabel.text  = modelCoins.name
        let fileUrl = URL(string: modelCoins.icon)!
        Nuke.loadImage(with: fileUrl , into: cell.coinImage)
        cell.priceLabel.text = "\(currency)\(String(format:"%.2f",modelCoins.price as! CVarArg))"
        
        if modelCoins.priceChange1D! > 0{
            UIFont.boldSystemFont(ofSize: cell.priceChange1d.font.pointSize)
            cell.priceChange1d.text = "↑\(modelCoins.priceChange1D! )%"
            cell.priceChange1d.textColor = #colorLiteral(red: 0.4775124968, green: 0.8557895689, blue: 0.244432954, alpha: 1)
            cell.priceLabel.textColor = #colorLiteral(red: 0.4775124968, green: 0.8557895689, blue: 0.244432954, alpha: 1)
        } else{
            cell.priceChange1d.text = "↓\(modelCoins.priceChange1D! )%"
            cell.priceChange1d.textColor = #colorLiteral(red: 1, green: 0.1727204666, blue: 0.1643627906, alpha: 1)
            cell.priceLabel.textColor = #colorLiteral(red: 1, green: 0.1727204666, blue: 0.1643627906, alpha: 1)
        }
        
        return cell
    }
    
    
    @objc private func refreshWeatherData(_ sender: Any) {
        // Fetch Weather Data

        self.fetchData()
        
        self.refreshControl.endRefreshing()
       
    print("refresh")
            
    }
    
}


extension HomeViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO // 1
   
           searchController.searchResultsUpdater = self
           // 2
           searchController.obscuresBackgroundDuringPresentation = true
           // 3
           searchController.searchBar.placeholder = "Search Coins"
           // 4
           navigationItem.searchController = searchController
           // 5
           definesPresentationContext = true
          let searchBar = searchController.searchBar
          
  
         // filterContentForSearchText(searchBar.text!)
      
  }
}
