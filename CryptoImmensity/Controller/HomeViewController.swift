//
//  ViewController.swift
//  CryptoImmensity
//
//  Created by miadjalili on 12/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var marketModel = GetMarkrt()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(UINib(nibName: "TableViewCellHome", bundle: nil), forCellReuseIdentifier: TableViewCellHome.identifier)
        self.getMarket()
       
    }
    
    
    
    func fetchData(currency:String = "USD"){
        APIClient.GetCoins(currency: currency) { result in
            switch result {
            case .success(let Coins):
                print(Coins.coins.count)
           
               
                self.tableView.reloadData()
            case .failure(let error):
                print("ERRor")
                print(error)
            }
        }
    }
    
    
    func getMarket(coinId:String = "bitcoin"){
        APIClient.GetMarket(coinID: coinId) { result in
            switch result{
            case .success(let Market):
                    // print("3")
                self.marketModel = Market
                self.tableView.reloadData()
               // print(Market)
            case .failure(let error):
            print(error)
            }
        }
    }

}



extension HomeViewController : UITableViewDelegate,UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketModel.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelmarket  = marketModel[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellHome.identifier, for: indexPath) as? TableViewCellHome else {
            return UITableViewCell()
        }
        cell.rankLabel.text = "\(indexPath.row + 1)"
        cell.coinNameLabel.text  = modelmarket.pair
        //   cell.configure(with: TableViewCellHomeViewModel(with: model))
        return cell
    }
    
}
