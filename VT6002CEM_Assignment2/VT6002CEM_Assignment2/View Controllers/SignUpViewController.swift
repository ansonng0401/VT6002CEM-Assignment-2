//
//  SignUpViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 3/1/2022.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()//function connect to the Utilities for ui design
        configureTextFields()//The keyboard can be hidden when the user is not pressed keyboard interface
        configuteTapGesture()//The keyboard can be hidden when the user is not pressed keyboard interface
    }
    
    private func configureTextFields(){//The keyboard can be hidden when the user is not pressed keyboard interface
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    private func configuteTapGesture(){//The keyboard can be hidden when the user is not pressed keyboard interface
        let tapGesture = UITapGestureRecognizer(target: self,action:
                                                    #selector(LoginViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func handleTap(){ //The keyboard can be hidden when the user is not pressed keyboard interface
        print("handle tap was called")
        view.endEditing(true)
    }
    
    
    func setUpElements(){ //function connect to the Utilities for ui design
        errorLabel.alpha=0
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
    }
    
    func validateFields() -> String? {
        // Check is it the text fields is filled
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all informations."
            //if not returm Please fill in all informations.
        }
        
        // Requiremet of setting the password need at least 8 characters, contains a special character and a number
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError("Error creating user")
                }
                else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data") //"If connection error show error Message"
                        }
                    }
                    self.transitionToHome() // function when the signup is success move to mainpage "MainTabController"
                }
            }
            
        }
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() { // function when the signup is success move to mainpage "MainTabController"
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        present(mainTabController, animated: true,completion: nil)
    }
    
}

