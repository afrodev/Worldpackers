//
//  HitsTableViewController.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 27/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit
import SVProgressHUD

class HitsTableViewController: UITableViewController {
    let service = HitService()
    var searchText: String!
    var arrayHits: [HitViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        service.delegate = self
        service.getHits(searchText: searchText)
        
        self.view.alpha = 0.5
        SVProgressHUD.show()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = searchText
        self.navigationController?.navigationBar.tintColor = .white

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 54/255.0, green: 154/255.0, blue: 194/255.0, alpha: 1.0)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayHits.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHit", for: indexPath)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // Optimization TableViewCell
        let hitViewModel = self.arrayHits[indexPath.row]
        (cell as! HitTableViewCell).configure(hit: hitViewModel)
        
    }

}
