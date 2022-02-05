//
//  WhaleAlertViewController.swift
//  CryptoImmensity
//
//  Created by miadjalili on 2/3/22.
//

import UIKit
import WebKit

class WhaleAlertViewController: UIViewController {
    let  webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        guard let url = URL(string: "https://whale-alert.io/transaction-map-embed.shtml") else {
            return
        }
        webView.scrollView.isScrollEnabled = false
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: url))
        }
        
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            webView.frame = view.bounds
        }


}
