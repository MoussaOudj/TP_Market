//
//  SearchViewController.swift
//  TP_search_market
//
//  Created by OUDJAMA Moussa (Canal Plus) on 02/12/2020.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    var locationManager:CLLocationManager!
    
    var data:[Marketplace]?
    var filteredData:[Marketplace]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        self.locationManager = locationManager
        
        print("map delegate self")
        self.map.showsUserLocation = true
        self.map.delegate = self
        
        let marketRequester = MarketRequester()
        marketRequester.requestForMarket { result in
            print("REQUEST DONE WITH RESULT : \(result)")
            self.data = result
            self.filteredData = result
        }
    }
}

extension SearchViewController : MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        print("func mapView Called")
        
        guard let loc = userLocation.location else { return }
        //permet de zoom sur coordinate
        mapView.setRegion(MKCoordinateRegion(center: loc.coordinate, latitudinalMeters: 30000, longitudinalMeters: 50000), animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "market_annotation_view")
        if annotationView == nil {
            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "market_annotation_view")
            pinAnnotationView.canShowCallout = true
            pinAnnotationView.pinTintColor = .blue
            annotationView = pinAnnotationView
        }else{
            annotationView!.annotation = annotation
        }
        return annotationView
    }
}

extension SearchViewController:CLLocationManagerDelegate{
}

extension SearchViewController:UISearchBarDelegate{
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.map.removeAnnotations(self.map.annotations)
        
        filteredData = []
        
        if let dataMarket = data {
            for market in dataMarket {
                if market.name.lowercased().contains(searchText.lowercased()) {
                    filteredData?.append(market)
                }
            }
        }
        
        guard let filterData = filteredData else { return }
        
        filterData.forEach { market in
            let marketAnnotation = CustomMarketAnnotation(products: market.products)
            marketAnnotation.title = market.name
            marketAnnotation.coordinate = CLLocationCoordinate2DMake(market.location.latitude, market.location.longitude)
            self.map.addAnnotation(marketAnnotation)
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let selectedAnnotation = view.annotation as? CustomMarketAnnotation else { return }
        guard let title = selectedAnnotation.title else { return }
        let location = selectedAnnotation.coordinate
        let products = selectedAnnotation.productList
        self.navigationController?.pushViewController(MarketInfoViewController(marketTitle: title,marketLocation: location,marketProducts: products ), animated: true)
    }
}


