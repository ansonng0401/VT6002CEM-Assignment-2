//
//  LoginViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 3/1/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

    }
    func setUpElements(){
        errorLabel.alpha=0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
//    */
//    @IBAction func loginTapped(_ sender: Any) {
//    }
    
}
