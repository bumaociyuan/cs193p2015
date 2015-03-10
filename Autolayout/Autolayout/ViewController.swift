//
//  ViewController.swift
//  Autolayout
//
//  Created by zx on 3/10/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var secure: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    var loggedInUser: User? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secure Password" : "Password"
    }
    @IBAction func toggleSecurity() {
        secure = !secure;
    }
    @IBAction func login() {
//        loggedInUser = User.login(loginField.text ?? "", passwordField.text ?? "")
  
        User.login
    
    }
}

