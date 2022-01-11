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
        getData()
        
        
    }
    
    
    func getData(){
        let db = Firestore.firestore()
        name.text = Auth.auth().currentUser?.email
    }

}
