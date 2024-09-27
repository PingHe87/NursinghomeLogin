//
//  CreateAccountViewController.swift
//  NursingHomeLogin
//
//  Created by p h on 9/26/24.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //signupButton
    @IBAction func signupClicked(_ sender: UIButton) {
        
        //This checks whether emailTextField.text contains a value. If it is not nil, the value is unwrapped and assigned to email.
        guard let email = emailTextField.text else{ return }
        guard let password = passwordTextField.text else{ return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let error = error as NSError? {
                if error.code == AuthErrorCode.emailAlreadyInUse.rawValue {
                    // Show a user-friendly error message
                    print("The email address is already in use by another account.")
                    // Optionally, you could prompt the user to log in instead
                } else{
                    //go to home screen
                    self.shouldPerformSegue(withIdentifier: "goToNext", sender: self)
                }
            }
            
        }
    }
}

