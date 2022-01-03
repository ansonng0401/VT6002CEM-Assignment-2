//
//  MilkTeaMapViewController.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 3/1/2022.
//

import MapKit
import CoreLocation

class MilkTeaMapViewController: UIViewController {
    @IBOutlet weak var mapView : MKMapView?
    
    
    var annotations = [MKPointAnnotation]();
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let MilkTeaAnnotation = MKPointAnnotation();
        MilkTeaAnnotation.coordinate = CLLocationCoordinate2D(latitude: 22.296971, longitude: 114.1745367);
        MilkTeaAnnotation.title = "Shan Tea";
        
        let MilkTeaAnnotation1 = MKPointAnnotation();
        MilkTeaAnnotation1.coordinate = CLLocationCoordinate2D(latitude: 22.2978253, longitude: 114.1711554);
        MilkTeaAnnotation1.title = "Macau Resturant";
        
        let MilkTeaAnnotation2 = MKPointAnnotation();
        MilkTeaAnnotation2.coordinate = CLLocationCoordinate2D(latitude: 22.2760268, longitude: 114.1729209);
        MilkTeaAnnotation2.title = "A CUP OF TEA WAN CHAI";
        
        let MilkTeaAnnotation3 = MKPointAnnotation();
        MilkTeaAnnotation3.coordinate = CLLocationCoordinate2D(latitude: 22.2827413, longitude: 114.1537077);
        MilkTeaAnnotation3.title = "Lan Fong Yuen";
        
        let MilkTeaAnnotation4 = MKPointAnnotation();
        MilkTeaAnnotation3.coordinate = CLLocationCoordinate2D(latitude: 22.2784725, longitude: 114.192151);
        MilkTeaAnnotation3.title = "Bing Kee Cha Dong";
        
        let MilkTeaAnnotation5 = MKPointAnnotation();
        MilkTeaAnnotation3.coordinate = CLLocationCoordinate2D(latitude: 22.2755345, longitude: 114.1726029);
        MilkTeaAnnotation3.title = "金鳳茶餐廳";
        
        let MilkTeaAnnotation6 = MKPointAnnotation();
        MilkTeaAnnotation6.coordinate = CLLocationCoordinate2D(latitude: 22.3223001, longitude: 114.1696223);
        MilkTeaAnnotation6.title = "Kam Wah Cafe & Bakery";
        
        let MilkTeaAnnotation7 = MKPointAnnotation();
        MilkTeaAnnotation7.coordinate = CLLocationCoordinate2D(latitude: 22.334305, longitude: 114.1965316);
        MilkTeaAnnotation7.title = "金寶冰廳";
        
        let MilkTeaAnnotation8 = MKPointAnnotation();
        MilkTeaAnnotation8.coordinate = CLLocationCoordinate2D(latitude: 22.2860597, longitude: 114.1498502);
        MilkTeaAnnotation8.title = "Shui Kee Coffee";
        
        let MilkTeaAnnotation9 = MKPointAnnotation();
        MilkTeaAnnotation9.coordinate = CLLocationCoordinate2D(latitude: 22.32963847017184, longitude: 114.18896994693476);
        MilkTeaAnnotation9.title = "樂園";
        
        let MilkTeaAnnotation10 = MKPointAnnotation();
        MilkTeaAnnotation10.coordinate = CLLocationCoordinate2D(latitude: 22.2775350623987, longitude: 114.17394885667291);
        MilkTeaAnnotation10.title = "檀島咖啡餅店";
        self.annotations.append(MilkTeaAnnotation10);
        self.annotations.append(MilkTeaAnnotation9);
        self.annotations.append(MilkTeaAnnotation8);
        self.annotations.append(MilkTeaAnnotation7);
        self.annotations.append(MilkTeaAnnotation6);
        self.annotations.append(MilkTeaAnnotation5);
        self.annotations.append(MilkTeaAnnotation4);
        self.annotations.append(MilkTeaAnnotation3);
        self.annotations.append(MilkTeaAnnotation2);
        self.annotations.append(MilkTeaAnnotation1);
        self.annotations.append(MilkTeaAnnotation);
        
        self.mapView?.addAnnotations(self.annotations);
        
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

