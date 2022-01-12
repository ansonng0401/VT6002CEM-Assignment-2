//
//  SettingPageViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 5/1/2022.
//

import UIKit
import Firebase


class SettingPageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getFireBaseData() //When Run Setting Page Run getFireBaseData() function to get user email address
    }
    
    
    func getFireBaseData(){
        let db = Firestore.firestore() // let db as Firestore.firestore()
        email.text = Auth.auth().currentUser?.email // let label (email) get firebase email address and show at at this label
    }
    
    
    //notifyUser User function, for alert users
    func notifyUser(_ msg: String, err:String?){
        let alert = UIAlertController(title: msg, message: err, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    //logout button code for sign out the account
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
    
    @IBAction func didTapButton(){ // function for when pick up photo show the photo library
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
}

//functions for get the image at photo library and show it on Image view
extension SettingPageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}
