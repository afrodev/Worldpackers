//
//  CategoryTableViewController.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 28/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    let arrayImages = [
        UIImage(named: "hostel-life"),
        UIImage(named: "social-impact"),
        UIImage(named: "nature-lovers"),
        UIImage(named: "social-media"),
        UIImage(named: "photography"),
        UIImage(named: "chef-to-the-world"),
        UIImage(named: "hands-on"),
        UIImage(named: "short-trip"),
        UIImage(named: "long-jorney")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayImages.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // MARK: Optimization TableViewCell
        (cell as! CategoryTableViewCell).imageViewPhoto.image = arrayImages[indexPath.row]
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategory", for: indexPath)

        return cell
    }

}
