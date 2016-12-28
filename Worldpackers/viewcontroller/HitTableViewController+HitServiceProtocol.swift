//
//  HitTableViewController+HitServiceProtocol.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 27/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import SVProgressHUD

extension HitsTableViewController: HitServiceProtocol {
    
    // MARK: Protocol Return
    func finishGetHits(hits: [Hit]) {
        self.arrayHits = hits
        self.view.alpha = 1
        
        SVProgressHUD.dismiss()
        self.tableView.reloadData()
    }
}
