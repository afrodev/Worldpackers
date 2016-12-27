//
//  SearchViewController.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 27/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit
import SVProgressHUD

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Dimiss Keyboard touching anywhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        SVProgressHUD.dismiss()

        
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.view.gestureRecognizers?.removeAll()
        self.navigationController?.navigationBar.isHidden = false
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func actionSearchTextField(_ sender: Any) {
        if let searchText = self.searchTextField.text {
            self.performSegue(withIdentifier: "segueTableViewController", sender: searchText)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc2 = segue.destination as? HitsTableViewController {
            vc2.searchText = sender as? String
        }

    }
 

}
