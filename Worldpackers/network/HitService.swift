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

// MARK: Protocol to return Hits when the request is over
protocol HitServiceProtocol: class {
    func finishGetHits(hits: [Hit])
}

class HitService {
    private let strURL = "https://staging-worldpackersplatform.herokuapp.com/api/search?q="
    var delegate: HitServiceProtocol?
    
    let headers: HTTPHeaders = [
        "Accept": "application/vnd.worldpackers.com.v6+json",
        "Authorization": "bearer 9e5a86cfca45eba00668e1baf15fd8dd65c15ad760e00845b81995d242844cdd"
    ]
    
    // MARK: Get all hits from search text
    func getHits(searchText: String) {
        guard let newURL = "https://staging-worldpackersplatform.herokuapp.com/api/search?q=\(searchText)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            self.delegate?.finishGetHits(hits: [])
            return 
        }

        Alamofire.request(newURL, headers: headers).responseJSON { response in
            guard let data = response.data else {
                self.delegate?.finishGetHits(hits: [])
                return
            }
            
            guard let jsonString = JSON(data: data)["hits"].rawString() else {
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
