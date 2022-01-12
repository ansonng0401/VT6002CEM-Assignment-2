//
//  MainPageViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 3/1/2022.
//

import UIKit
import Firebase

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getFirebaseData() //When Run Setting Page Run getFirebaseData() function to get user email address
    }
    
    
    func getFirebaseData(){
        let db = Firestore.firestore() // let db as Firestore.firestore()
        name.text = Auth.auth().currentUser?.email // let label (name) get firebase email address and show at at this label
    }
    
}
