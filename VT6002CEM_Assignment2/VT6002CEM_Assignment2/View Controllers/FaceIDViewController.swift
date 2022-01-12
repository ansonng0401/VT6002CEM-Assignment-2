//
//  FaceIDViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 10/1/2022.
//

import UIKit
import LocalAuthentication

class FaceIDViewController: UIViewController {
    
    //notifyUser User function, for alert users
    func notifyUser(_ msg: String, err:String?){
        let alert = UIAlertController(title: msg, message: err, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        self.notifyUser("Welcome", err: "Please Use Biometrics sensor to enter the memo") // First time run FaceIDViewController Page will show the alert box "Welcome"  "Please Use Biometrics sensor to enter the memo"
        super.viewDidLoad()
    }
    
    @IBAction func biometricBtn(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(
                LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Access requires authentication",
                reply: {(success,error) in DispatchQueue.main.async{
                    if let err = error{  // if error will show the alert message
                        switch err._code{
                        case LAError.Code.systemCancel.rawValue:
                            self.notifyUser("Session cancelled", err: err.localizedDescription)
                        case LAError.Code.userCancel.rawValue:
                            self.notifyUser("Plesase try again", err: err.localizedDescription)
                        case LAError.Code.userFallback.rawValue:
                            self.notifyUser("Authentication", err: "Password option selected")
                        default:
                            self.notifyUser("Authentication is failed", err: err.localizedDescription)
                        }
                    }else{
                        //move to MemoNavViewController page
                        let navviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "MemoNavViewController") as! MemoNavViewController
                        self.present(navviewcontroller, animated: true,completion: nil)
                    }
                }
                    
                })
            
        }else{
            //IF Device cannot use biometric authentication, Show alert message
            if let err = error{
                switch err.code{
                case LAError.Code.biometryNotEnrolled.rawValue:
                    notifyUser("User is not enrolled", err: err.localizedDescription)
                case LAError.Code.passcodeNotSet.rawValue:
                    notifyUser("A passcode has not been set", err: err.localizedDescription)
                case LAError.Code.biometryNotAvailable.rawValue:
                    notifyUser("Biometric authentication not available", err:err.localizedDescription)
                default:
                    notifyUser("Unknown error", err:err.localizedDescription)
                }
            }
        }
        
    }
    
    
    
}
