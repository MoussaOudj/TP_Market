//
//  MarketInfoViewController.swift
//  TP_search_market
//
//  Created by OUDJAMA Moussa (Canal Plus) on 08/12/2020.
//

import UIKit
import MapKit
import SDWebImage

class MarketInfoViewController: UIViewController {
    
    
    var delegateTitle:String
    var delegateLocation:CLLocationCoordinate2D
    var delegateProducts:[Product]
    
    @IBOutlet weak var marketTitle: UILabel!
    @IBOutlet weak var marketLocation: UILabel!
    @IBOutlet weak var productTable: UITableView!
    
    
    init(marketTitle:String, marketLocation:CLLocationCoordinate2D, marketProducts:[Product]) {
        self.delegateTitle = marketTitle
        self.delegateLocation = marketLocation
        self.delegateProducts = marketProducts
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.productTable.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "productItem")
        self.productTable.delegate = self
        self.productTable.dataSource = self
        self.marketTitle.text = self.delegateTitle
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(CLLocation(latitude: self.delegateLocation.latitude, longitude: self.delegateLocation.longitude)) {
            (placemarks, err) in
            guard let ps = placemarks, err == nil else {
                return
            }
            
            guard let rue = ps.last?.thoroughfare else {
                return
            }
            guard let numero = ps.last?.subThoroughfare else {
                return
            }
            self.marketLocation.text = "\(numero) \(rue)"
        }
    }
}


extension MarketInfoViewController:UITableViewDelegate{
}

extension MarketInfoViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.delegateProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productItem", for: indexPath) as!ProductTableViewCell
        cell.productNameLabel.text = self.delegateProducts[indexPath.row].name
        cell.priceLabel.text = "\(self.delegateProducts[indexPath.row].price) €"
        cell.productDescriptionLabel.text =  self.delegateProducts[indexPath.row].description
        cell.productImage.sd_setImage(with: URL(string: self.delegateProducts[indexPath.row].image), completed: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height/2 + 18
    }
}
