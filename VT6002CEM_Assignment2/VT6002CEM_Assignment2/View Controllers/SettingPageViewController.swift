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
        getData()
    }
    
    func getData(){
        let db = Firestore.firestore()
        email.text = Auth.auth().currentUser?.email
        
        
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
    
    @IBAction func didTapButton(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

}

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

/*
 MARK: - Navigation
 
 In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 Get the new view controller using segue.destination.
 Pass the selected object to the new view controller.
 }
 */


