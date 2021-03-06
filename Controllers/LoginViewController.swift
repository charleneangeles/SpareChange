//
//  LoginViewController.swift
//  SpareChange
//
//  Created by Charlene Angeles on 10/24/17.
//  Copyright © 2017 deHao. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    @IBAction func btnLogin(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainmenu")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Login Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                        (result : UIAlertAction) -> Void in print("OK")
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    
}
