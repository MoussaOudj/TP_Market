//
//  HomeViewController.swift
//  TP_search_market
//
//  Created by OUDJAMA Moussa (Canal Plus) on 02/12/2020.
//

import UIKit
import CoreLocation //import pour la geoLoc

class HomeViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func navigateToSearchView(_ sender: Any) {
        self.navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    
}
