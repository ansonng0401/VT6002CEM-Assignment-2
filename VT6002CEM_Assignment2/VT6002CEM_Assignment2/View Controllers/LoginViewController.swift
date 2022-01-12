//
//  LoginViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 3/1/2022.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements() //function connect to the Utilities for ui design
        configureTextFields()//The keyboard can be hidden when the user is not pressed keyboard interface
        configuteTapGesture()//The keyboard can be hidden when the user is not pressed keyboard interface
    }
    
    func setUpElements(){ //function connect to the Utilities for ui design
        errorLabel.alpha=0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
    }
    
    private func configureTextFields(){ //The keyboard can be hidden when the user is not pressed keyboard interface
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    private func configuteTapGesture(){ //The keyboard can be hidden when the user is not pressed keyboard interface
        let tapGesture = UITapGestureRecognizer(target: self,action:
                                                    #selector(LoginViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func handleTap(){ //The keyboard can be hidden when the user is not pressed keyboard interface
        print("handle tap was called")
        view.endEditing(true)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in //Connect to database check the password, useremail is it correct
            
            if error != nil { //if error show error message lable
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                //move the MainTabController (main page)
                let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
                self.present(mainTabController, animated: true,completion: nil)
            }
        }
    }
    
    
    
    
}

