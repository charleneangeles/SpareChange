//
//  RegisterViewController.swift
//  SpareChange
//
//  Created by Charlene Angeles on 10/24/17.
//  Copyright © 2017 deHao. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var txtEM: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    @IBOutlet weak var txtConfirmPW: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    let userNodeRef = Database.database().reference().child("users")
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnRegister(_ sender: Any) {
        if let email = txtEM.text, let password = txtPW.text
        {
            Auth.auth().createUser(withEmail: email, password: password) {(user, error) in
                if user != nil{
            
                    let userValues = ["email": email]
                    self.userNodeRef.child((user?.uid)!).updateChildValues(userValues, withCompletionBlock: {(userDBError, userDBRef) in
                        
                        if userDBError != nil{
                            
                            let helper = UIHelpers()
                            helper.showAlert(alertTitle:"User Registration Failed", alertMessage: "We were unable to save your information to the database. Contact your Systems Administrator for details", vc:self)
                            return
                        }
                    })
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainmenu")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Registration Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    
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
        txtEM.resignFirstResponder()
        txtPW.resignFirstResponder()
        }
}


