//
//  HitService.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 27/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import RealmSwift


// Protocolo para retornar as informações de uma banda
protocol HitServiceProtocol: class {
    func finishGetHits(hits: [Hit])
}


class HitService {
    private let strURL = "https://staging-worldpackersplatform.herokuapp.com/api/search?q="
    var delegate: HitServiceProtocol?
    
    let header: Parameters = [
        "Accept": "application/vnd.worldpackers.com.v6+json",
        "Authorization": "bearer 9e5a86cfca45eba00668e1baf15fd8dd65c15ad760e00845b81995d242844cdd"
    ]
    
    
    func getHits(searchText: String) {
        let newURL = strURL + searchText
        
        Alamofire.request(newURL).responseJSON { (response) in
            guard let data = response.data else {
                self.delegate?.finishGetHits(hits: [])
                return
            }
            
            guard let jsonString = JSON(data: data).rawString() else {
                self.delegate?.finishGetHits(hits: [])
                return
            }
            
            guard let list: [Hit] = Mapper<Hit>().mapArray(JSONString: jsonString) else {
                self.delegate?.finishGetHits(hits: [])
                return
            }
            
            self.delegate?.finishGetHits(hits: list)
        }
        
        
    }
    
    
}
