//
//  LoginViewController.swift
//  Philanthrofeed
//
//  Created by Rish Chaudhary on 4/6/22.
//


import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        usernameField.text?.removeAll()
        passwordField.text?.removeAll()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "toFeedScreen", sender: nil)
            } else {
                print("ERROR: Invlid username or password")
            }
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let user = PFUser()
        
        user.username = usernameField.text ?? ""
        user.password = passwordField.text ?? ""
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "toFeedScreen", sender: nil)
            } else {
                print("ERROR: \(error?.localizedDescription ?? "Unknown Error")")
            }
        }
        
    }
    
}
