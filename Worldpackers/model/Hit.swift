//
//  Hit.swift
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


class Hit: Object, Mappable {
    dynamic var id: String!
    dynamic var title: String!
    dynamic var city: String!
    dynamic var country: String!
    dynamic var rating: String!
    dynamic var reviews_count: String!
    dynamic var photo_url: String!
    dynamic var url: String!
    dynamic var accommodation_type_slug: String!
    dynamic var meals_count: String!
    dynamic var wish_list_count: String!
    dynamic var trips_count: String!
    dynamic var teaser_badge: String!
    dynamic var hosting_since: String!
    
    // MARK:  Método que obrigatório do Realm
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.city <- map["city"]
        self.country <- map["country"]
        self.rating <- map["rating"]
        self.reviews_count <- map["reviews_count"]
        self.photo_url <- map["photo_url"]
        self.url <- map["url"]
        self.accommodation_type_slug <- map["accommodation_type_slug"]
        self.meals_count <- map["meals_count"]
        self.wish_list_count <- map["wish_list_count"]
        self.trips_count <- map["trips_count"]
        self.teaser_badge <- map["teaser_badge"]
        self.teaser_badge <- map["teaser_badge"]
        self.hosting_since <- map["hosting_since"]
        
        self.save()
    }
    
    // MARK: Salva o objeto mapeado no Realm
    func save() {
        let realm = try! Realm()
        /*
         do {
         // MARK: Transforma Data em UIImage
         if let url = URL(string: self.urlImage) {
         print(url)
         let imageData = try Data(contentsOf: url)
         self.imageData = imageData
         }
         } catch {
         self.imageData = nil
         print("erro imagem model")
         }
         */
        try! realm.write {
            realm.add(self, update: true)
        }
    }
    
    
    
    
}
