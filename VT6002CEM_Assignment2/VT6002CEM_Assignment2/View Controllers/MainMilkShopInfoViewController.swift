//
//  MainMilkShopInfoViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 7/1/2022.
//

import UIKit
var placeNames = ["蘭芳園 Lan Fong Yuen","2","3","4","5"]
var placeAddress=["2 Gage St, Central","2"]
var placeTel=["2544 3895","2"]
var placeBusinehours=["(Monday to Saturday)07:30am-18:00pm","2"]
var placeImages=["HK_Lan_Fong_Yuen_Old_Shop.jpeg","2"]
var placeDesc = ["Lan Fong Yuan, which opened in 1952, operated as a food stall in the early years. Although it now has its main store in Central, Sheung Wan and two branches in Tsim Sha Tsui, the iron-clad stall on the street still remains to this day. Lanfangyuan is the first to use silk stockings to brew milk tea. The tea is brewed with post-season tea leaves from Colombo, Sri Lanka and non-dairy milk from Malaysia. The mouth is smooth and the tea fragrance is sweet. Over the years, it has attracted countless tourists and Hong Kong people to patronize, becoming a famous brand representative in the milk tea industry","2","3","4","5"]
var placegooglemapurl=["https://www.google.com.hk/maps/place/%E8%98%AD%E8%8A%B3%E5%9C%92/@22.3079123,114.2521856,15z/data=!4m5!3m4!1s0x3404007b6fb3ed51:0x3f55838a3a330da3!8m2!3d22.2827255!4d114.1537155","2"]

var myIndex=0

class MainMilkShopInfoViewController: UIViewController {


    @IBOutlet var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension MainMilkShopInfoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text =  placeNames[indexPath.row]
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        myTable.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "MilkShopInfo", sender: self)
    }
    
    
}
