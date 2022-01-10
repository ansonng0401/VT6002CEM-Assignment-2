//
//  WebViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 3/1/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
let webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        guard let url = URL(string: "https://www.hkichdb.gov.hk/en/item.html?aebd99be-73ff-4a8d-a327-41296eafbc12")
        else {
            return
        }
        webView.load(URLRequest(url: url))
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }


}
