//
//  SearchViewController.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 27/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("logou")
    }
    
    
    @IBAction func actionButton(_ sender: Any) {
        let searchText = "São Paulo"
        self.performSegue(withIdentifier: "segueTableViewController", sender: searchText)

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let vc2 = segue.destination as? HitsTableViewController {
            vc2.searchText = sender as? String
        }

    }
 

}
