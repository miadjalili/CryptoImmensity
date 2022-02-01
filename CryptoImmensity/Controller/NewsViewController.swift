//
//  NewsViewController.swift
//  CryptoImmensity
//
//  Created by miadjalili on 2/2/22.
//

import UIKit
import Nuke

class NewsViewController: UIViewController {
    private var newsModel : [News] = [News]()
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource =  self
        tableView.register(UINib(nibName: TableViewCellNews.name, bundle: nil), forCellReuseIdentifier: TableViewCellNews.identifier)
        self.getNews()
    }
    
    func getNews(){
        APIClient.GetNews { result in
            switch result{
            case .success(let News):
                self.newsModel = News.news
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension NewsViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelNews  = newsModel[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellNews.identifier, for: indexPath) as? TableViewCellNews else {
            return UITableViewCell()
        }
        let fileUrl = URL(string: modelNews.imgURL)!
         Nuke.loadImage(with: fileUrl , into: cell.imageNews)
        cell.titleLabel.text = modelNews.title
        return cell
    }
    
    
    
    
    
}
