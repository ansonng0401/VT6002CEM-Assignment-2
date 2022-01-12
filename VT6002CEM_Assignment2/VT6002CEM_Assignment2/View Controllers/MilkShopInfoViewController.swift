//
//  MilkShopInfoViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 7/1/2022.
//

import UIKit
class MilkShopInfoViewController: UIViewController {
    
    
    
    @IBOutlet weak var placeDescriptionTextView: UITextView!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    @IBOutlet weak var PlaceBusinehoursLabel: UILabel!
    @IBOutlet weak var placeTelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //connect the lable to the array for show the shop information
        placeNameLabel.text=placeNames[myIndex]
        placeImage.image = UIImage(named: placeImages[myIndex])
        placeDescriptionTextView.text=placeDesc[myIndex]
        placeAddressLabel.text=placeAddress[myIndex]
        placeTelLabel.text=placeTel[myIndex]
        PlaceBusinehoursLabel.text=placeBusinehours[myIndex]
    }
    
    
    @IBAction func urlButton(_ sender: Any) {
        UIApplication.shared.open(URL(string:placegooglemapurl[myIndex])! as URL, options: [:], completionHandler:nil)
    }
}
