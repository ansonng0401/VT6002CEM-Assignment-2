//
//  MainMilkShopInfoViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 7/1/2022.
//

import UIKit

// set the varliable, at put the array of shop informations
var placeNames = ["Lan Fong Yuen","Bing Kee Cha Dong","Kam Fung Restaurant","金寶冰廳","Kam Wah Cafe & Bakery","Shui Kee Coffee","Tea Master","Lok Yuen","Honolulu Coffee Shop"]
var placeAddress=["2 Gage St, Central","5 Shepherd St, Tai Hang","41 Spring Garden Ln, Wan Chai","53 Hong Keung St, San Po Kong","45-47 Bute St, Mong Kok","Shop 17, Cooked Food Centre, 2/F, Sheung Wan Municipal Services Building","G/F, 113 Sai Yee Street, Mong Kok","Shop 6, 3/F, Kowloon City Municipal Building","G/F & Mezz Floor, 176-178 Hennessy Rd., Wan Chai"]
var placeTel=["2544 3895","25773117","2572 0526","2320 7684","2392 6830","2850 8643","2556 6077","2382 3367","2575 1823"]
var placeBusinehours=["(Monday to Saturday)07:30am-18:00pm","(Tuesday to Sunday)07:00am-15:30pm","06:45am-19:00pm","07:00am–22:00pm","06:30am-23:30pm","(Monday to Saturday)07:30am-17:00pm","07:30am-18:00pm","(Monday to Friday) 07:15am-15:45pm, (Sat and public holidays) 07:15am-14:00pm","07:00am-22:00pm"]
var placeImages=["HK_Lan_Fong_Yuen_Old_Shop.jpeg","Bing Kee Cha Dong.jpg","金鳳茶餐廳.jpg","金寶冰廳.jpg","Kam Wah Cafe & Bakery.jpeg","ShuiKeeCoffee.jpeg","茶王冰室.jpg","九龍城樂園.jpeg","Honolulu CoffeeShop.jpg"]
var placeDesc = ["Lan Fong Yuan, which opened in 1952, operated as a food stall in the early years. Although it now has its main store in Central, Sheung Wan and two branches in Tsim Sha Tsui, the iron-clad stall on the street still remains to this day. Lanfangyuan is the first to use silk stockings to brew milk tea. The tea is brewed with post-season tea leaves from Colombo, Sri Lanka and non-dairy milk from Malaysia. The mouth is smooth and the tea fragrance is sweet. Over the years, it has attracted countless tourists and Hong Kong people to patronize, becoming a famous brand representative in the milk tea industry","Opened in the 1950s, Bing Kee Tea Stall is a popular civilian tea stall in Tai Hang! The signature pork chop noodles and milk tea are the two treasures of the town, which have attracted countless celebrities such as Eason Chan. Among them, milk tea was rated as one of the 4 best milk teas in Hong Kong by CNN in the early years. Smooth and never bitter, with a sweetness to it.","Opened in 1956, Kam Fung Restaurant has a history of more than 60 years and was selected as one of the top ten tea restaurants in Hong Kong in the early years. It attracts countless tourists and Hong Kong people with its signature Sambo Fresh Butter Pineapple Buns, milk tea and chicken batches. The famous milk tea is brewed with two kinds of tea leaves: Golden Rose Black Tea and Lipton Ceylon Black Tea. The two kinds of teas are mixed and blended with each other, and it has a tea fragrance without bitterness.","金寶冰廳, which started in 1978, is a time-honored tea restaurant in San Po Kong. When it opened in the early years, due to the location of Kai Tak Airport in the vicinity and the industrial area, the business was non-stop, but now it is mainly engaged in neighborhood business. The main ones are the common Cha Kee's common fried noodles, satay beef buns and milk tea. Among them, Campbell Milk Tea is mellow, creamy and rich, and three types of tea leaves, Lipton, Sihao and Jinbiao, are used to make the signature milk tea with smooth tea fragrance.","Kam Wah Cafe & Bakery, which opened in 1973, has a history of 47 years! The signature pineapple oil has always been well-known far and near, and thick and smooth milk tea is also one of the famous products. In the early years, it was voted as my favorite Hong Kong-style milk tea champion by online voting, which attracted much attention. The fragrant tea fragrance is paired with the silky milky fragrance, and basically everyone will drink it!","Drinking milk tea does not necessarily have to be the normal state of cup milk tea. Rui Kee Coffee has become its signature brand with bottled milk tea. Opened for more than 60 years, it is hidden in the Sheung Wan Municipal Market Cooked Food Center. Even though the menu options are not too expensive, it has been very popular with neighbors and tourists for many years. The owner's self-made glass bottle milk tea is better than the common hot milk tea. sought after! Bottled jelly is like bottled soda, with moderate sweetness. It tastes fragrant and full of tea aroma. Because it is frozen, it feels cooler than hot drinks.","Usually, when you go to Tea Kee to drink a cup of milk, you will find at most twenty mosquitoes, but this Tea Master offers the King of Tea at $88/cup, which is the most expensive among all tea restaurants in Hong Kong! The reason behind the high price is that it was brewed by Master Chen Ziping, the winner of the 'International Golden Tea King Competition' Hong Kong and International Championships in 2016! Among them, 6 different types of Sri Lankan tea are mixed to brew milk tea, and served in a gorgeous golden cup. At the same time, it is also accompanied by a small cup of ordinary milk tea and two small cookies, which can be used to taste the difference, and the color is more common. The milk tea is more golden in color, thick and slippery, and it tastes rich in layers and has a glycolic taste.","Kowloon City has always been a food center, attracting many celebrities and celebrities such as foraging! Cha Kee Paradise, located in the cooked food center of Kowloon City Municipal Market, was once given by Cai Lan as a rhetoric better than abalone wings, and Chow Yun-fat was also one of the guests! This is because different from the traditional tea in mind, there are many novel flavors. The milk tea in the paradise is famous for its long-lasting tea flavor. It has been extended into milk tea and red bean ice, and it has become one of the signatures. The red beans are full of bean fragrance and have bursts of tea aroma, which is more delicious than the usual red bean ice.","Opened in 1940, Honolulu Coffee Cake Shop is famous in Hong Kong for its puff pastry egg tarts and stockings milk tea. There are now 3 branches. The egg tart is said to have as many as 192 layers of puff pastry, and it tastes crispy and crispy on the outside. The milk tea has a strong and sweet taste and is smooth and delicate, making it the most popular treasure in the store. Honolulu Coffee Cake Shop has cooperated with Hung Fook Tong to launch Hong Kong-style milk tea in sticks, which can be enjoyed anytime, anywhere."]
var placegooglemapurl=["https://www.google.com.hk/maps/place/%E8%98%AD%E8%8A%B3%E5%9C%92/@22.3090853,114.1913539,13.09z/data=!4m12!1m6!3m5!1s0x3404007b6fb3ed51:0x3f55838a3a330da3!2z6Jit6Iqz5ZyS!8m2!3d22.2827177!4d114.1537154!3m4!1s0x3404007b6fb3ed51:0x3f55838a3a330da3!8m2!3d22.2827177!4d114.1537154","https://www.google.com.hk/maps/place/%E7%82%B3%E8%A8%98%E8%8C%B6%E6%AA%94/@22.3044736,114.165709,13z/data=!4m5!3m4!1s0x340401ab45c1ad5d:0x1885489acb0739ad!8m2!3d22.278433!4d114.1923186","https://www.google.com.hk/maps/place/%E9%87%91%E9%B3%B3%E8%8C%B6%E9%A4%90%E5%BB%B3/@22.2893797,114.171207,14.4z/data=!4m5!3m4!1s0x3404005cb0ee0f25:0x4bdcbd89f7586149!8m2!3d22.275502!4d114.1725736","https://www.google.com.hk/maps/place/%E9%87%91%E5%AF%B6%E5%86%B0%E5%BB%B3/@22.312538,114.1818372,13.57z/data=!4m5!3m4!1s0x340406d6c5d77b09:0x1c420fc93f30e095!8m2!3d22.3343376!4d114.1966101","https://www.google.com.hk/maps/place/%E9%87%91%E8%8F%AF%E5%86%B0%E5%AE%A4/@22.3017785,114.1419779,13.12z/data=!4m5!3m4!1s0x340400c84f755fc7:0x8be84595d44d5dcf!8m2!3d22.3222738!4d114.1697189","https://www.google.com.hk/maps/place/%E7%91%9E%E8%A8%98%E5%92%96%E5%95%A1/@22.3045826,114.1525559,13.35z/data=!4m5!3m4!1s0x3404007e9d1695e5:0xb392c0209dca79de!8m2!3d22.2860506!4d114.1499403","https://www.google.com.hk/maps/place/%E8%8C%B6%E7%8E%8B%E5%86%B0%E5%AE%A4+(%E6%97%BA%E8%A7%92%E5%BA%97)/@22.3096486,114.1589856,13.36z/data=!4m5!3m4!1s0x340401a02b2a5625:0xabecee54c17b6f73!8m2!3d22.320213!4d114.1715278","https://www.google.com.hk/maps/place/%E6%A8%82%E5%9C%92/@22.3155192,114.1915492,12.24z/data=!4m5!3m4!1s0x3404072addbd4811:0xf2a2a6d36901e6e4!8m2!3d22.3294584!4d114.1888505","https://www.google.com.hk/maps/place/%E6%AA%80%E5%B3%B6%E5%92%96%E5%95%A1%E9%A4%85%E5%BA%97/@22.2873696,114.1689124,14.49z/data=!4m5!3m4!1s0x3404005b78cba279:0x8457cc55f5d58d0c!8m2!3d22.2775198!4d114.1739512"]

var myIndex=0 //myIndex for count the array at the tableView

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
