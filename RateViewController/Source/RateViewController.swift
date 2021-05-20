//
//  RateViewController.swift
//  RateViewController
//
//  Created by Inx-MacMini-i3 on 20/05/21.
//

import Foundation
import UIKit
import WebKit

public protocol RateViewDelegate: class {
    func closeButtonPressed()
}


public class RateViewController:UIViewController{
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: CGRect.zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        return webView
    }()
    var activityIndicatorView: UIActivityIndicatorView!
    public var delegate: RateViewDelegate?
    
    
    // MARK: - Constructor
    
    open override func viewDidLoad() {
        commonInit()
    }
    
   

    // MARK: - Private methods

    private func commonInit() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(webView)
        self.view.backgroundColor = UIColor.white
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                webView.topAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
            ])
        }
        
        let myURL = URL(string: "https://www.usersnapdemo.com/mobile/view/index.php?email=klaus@schremser.com")
        let myRequest = URLRequest(url: myURL!)
        webView.navigationDelegate = self
        webView.load(myRequest)
        
        self.activityIndicatorView = UIActivityIndicatorView()
        self.activityIndicatorView.color = UIColor.black
        self.activityIndicatorView.hidesWhenStopped = true
        self.activityIndicatorView.startAnimating()
        self.activityIndicatorView.center = self.view.center
        self.view.addSubview(self.activityIndicatorView)
        self.activityIndicatorView.frame = CGRect(x: self.view.frame.width/2 - 25, y: self.view.frame.height/2 - 25, width: 50, height: 50)
        var topPadding:CGFloat = 0.0
        if  let window = UIApplication.shared.keyWindow{
            if #available(iOS 11.0, *) {
                topPadding = window.safeAreaInsets.top
            }
        }
        let btnClose = UIButton(frame: CGRect(x: self.view.frame.width - 44, y: 10 + topPadding, width: 34, height: 34))
        btnClose.layer.cornerRadius = 17
        btnClose.layer.masksToBounds = true
        btnClose.backgroundColor = UIColor.white
        btnClose.setImage(UIImage(named: "icn_close"), for: .normal)
        btnClose.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
        self.view.addSubview(btnClose)
        self.view.bringSubviewToFront(btnClose)
    }
    
    @objc func closePressed() {
        if self.delegate != nil{
            self.delegate?.closeButtonPressed()
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension RateViewController:WKNavigationDelegate{
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicatorView.stopAnimating()
    }
}
