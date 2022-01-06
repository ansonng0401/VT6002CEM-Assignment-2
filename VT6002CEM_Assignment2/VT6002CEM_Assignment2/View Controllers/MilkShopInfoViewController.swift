//
//  MilkShopInfoViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 7/1/2022.
//

import UIKit

class MilkShopInfoViewController: UIViewController {

   
    @IBOutlet weak var placeDescriptionLable: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        placeNameLabel.text=placeNames[myIndex]
        //placeImage.image = UIImage(name: placeImages[myIndex])
        placeDescriptionLable.text=placeDesc[myIndex]

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

}
