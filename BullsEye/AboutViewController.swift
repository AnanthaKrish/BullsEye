//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Anantha Krishnan K G on 05/07/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    var myContext = 0
    
    lazy var webView: WKWebView = {
        var webView = WKWebView()
        webView.navigationDelegate = self
        let url = URL(string: "https://ananthakrish.github.io")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: &myContext)
        return webView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(UIColor(hexFromString: "#601E00"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "Button-Normal"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "Button-Highlighted"), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    lazy var progressView:UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        progressView.tintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    func setUpView() {
        
        self.webView.addSubview(closeButton)
        self.webView.addSubview(progressView)

        view = webView
        
        
        progressView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        progressView.topAnchor.constraint(equalTo: self.webView.topAnchor).isActive = true
        progressView.widthAnchor.constraint(equalTo: self.webView.widthAnchor).isActive = true
        progressView.centerHorizontally()
        
        
        closeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: self.webView.bottomAnchor, constant: -20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        closeButton.centerHorizontally()
    }
    
    @objc func closeAction() {
        dismiss(animated: true, completion: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let change = change else { return }
        if context != &myContext {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        if keyPath == "estimatedProgress" {
            if let progress = (change[NSKeyValueChangeKey.newKey] as AnyObject).floatValue {
                progressView.progress = progress;
            }
            return
        }
    }

}

extension AboutViewController:WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        progressView.isHidden = false
    }
}
