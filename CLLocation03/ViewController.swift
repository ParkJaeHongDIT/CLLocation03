//
//  ViewController.swift
//  CLLocation03
//
//  Created by dit02 on 2019. 11. 7..
//  Copyright © 2019년 DIT. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //CLLocationManagerDelegate 객체와 ViewController 간의 연결
        
        
        
        mapView.mapType = MKMapType.hybrid
        
        
        //GPS 트래킹
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        mapView.showsUserLocation = true
        
        //5) center에 pin 꼽기
        let anno01 = MKPointAnnotation()
        anno01.coordinate.latitude = 35.164873
        anno01.coordinate.longitude = 129.071415
        anno01.title = "DIT 동의과학대학교"
        anno01.subtitle = "나의 꿈이 자라는 곳"
        //mapView.addAnnotation(anno01)
        //annoArray.append(anno01)
        
        //송상현 광장 35.164419, 129.064962
        let anno02 = MKPointAnnotation()
        anno02.coordinate.latitude = 35.164419
        anno02.coordinate.longitude = 129.064962
        anno02.title = "송상현 광장"
        anno02.subtitle = "푸른 잔디밭이 좋은곳"
        //mapView.addAnnotation(anno02)
        //annoArray.append(anno02)
        
        //번개반점 35.167783, 129.070598
        let anno03 = MKPointAnnotation()
        anno03.coordinate.latitude = 35.167783
        anno03.coordinate.longitude = 129.070598
        anno03.title = "번개반점"
        anno03.subtitle = "짜장면이 맛있는 집"
        //mapView.addAnnotation(anno03)
        //annoArray.append(anno03)
        
        mapView.showAnnotations([anno01, anno02, anno03], animated: true)
        
        
    }
    
    @IBAction func standardMapTypeAction(_ sender: Any) {
        mapView.mapType = MKMapType.standard
    }
    
    @IBAction func satelliteMapTypeAction(_ sender: Any) {
        mapView.mapType = MKMapType.satellite
    }
    
    @IBAction func hybridMapTypeAction(_ sender: Any) {
        mapView.mapType = MKMapType.hybrid
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations[0]
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        
    }
}


