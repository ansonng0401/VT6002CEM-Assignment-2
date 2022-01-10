//
//  SettingPageViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 5/1/2022.
//

import UIKit
import FirebaseAuth
import Firebase

class SettingPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func notifyUser(_ msg: String, err:String?){
        
        let alert = UIAlertController(title: msg, message: err, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func logoutbtn(_ sender: Any) {
        let auth = Auth.auth()
        
        do{
            try auth.signOut()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isUserSignedIn")
            self.dismiss(animated: true, completion: nil)
        }catch let signOutError {
            self.notifyUser("Authentication Successful", err: signOutError.localizedDescription)
        }
    }
}





/*
 MARK: - Navigation
 
 In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 Get the new view controller using segue.destination.
 Pass the selected object to the new view controller.
 }
 */


