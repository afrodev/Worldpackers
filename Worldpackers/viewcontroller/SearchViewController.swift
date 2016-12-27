//
//  SearchViewController.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 27/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, HitServiceProtocol {

    let service = HitService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("logou")
        
        service.delegate = self
        service.getHits(searchText: "sao paulo")
    }
    
    func finishGetHits(hits: [Hit]) {        
        for h in hits {
           print(h.id)
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
