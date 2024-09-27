//
//  LoginViewController.swift
//  NursingHomeLogin
//
//  Created by p h on 9/26/24.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

  
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginClicked(_ sender: UIButton) {
        //This checks whether emailTextField.text contains a value. If it is not nil, the value is unwrapped and assigned to email.
        guard let email = emailTextField.text else{ return }
        guard let password = passwordTextField.text else{ return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error{
                print("error")
            }else{
                //go to home screen
                self.shouldPerformSegue(withIdentifier: "goToNext", sender: self)
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
