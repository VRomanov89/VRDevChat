//
//  LoginVC.swift
//  VRDevChat
//
//  Created by Volodymyr Romanov on 8/24/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class LoginVC: UIViewController {
    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passField: RoundTextField!
    @IBAction func loginButton(_ sender: RoundButton) {
        if let email = emailField.text, let pass = passField.text , email.characters.count > 0 && pass.characters.count > 0 {
            // Call the login service. (MODEL)
            AuthService.instance.login(email: email, pass: pass, onComplete: { (errMsg, data) in
                guard errMsg == nil else {
                    let alert = UIAlertController(title: "error Authentication", message: errMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                self.dismiss(animated: true, completion: nil)
            })
            
        } else {
            let alert = UIAlertController(title: "Username & password required", message: "You must enter both username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
