//
//  Fear&GreedViewController.swift
//  CryptoImmensity
//
//  Created by miadjalili on 2/3/22.
//

import UIKit
import WebKit



class Fear_GreedViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
       //view.addSubview(webView)
        guard let url = URL(string: "https://alternative.me/crypto/fear-and-greed-index.png") else {
            return
        }
        webView.load(URLRequest(url: url))
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        webView.frame = view.bounds
//    }
    
}
