//
//  Hit.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 27/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: Is Mappable to convert JSON to Hit object
class Hit: Mappable {
    dynamic var id: Int = 0
    dynamic var title: String!
    dynamic var city: String!
    dynamic var country: String!
    dynamic var rating: Int = 0
    dynamic var reviewsCount: Int = 0
    dynamic var photoUrl: String!
    dynamic var price: Int = 0
    dynamic var url: String!
    dynamic var accommodationTypeSlug: String!
    dynamic var mealsCount: Int = 0
    dynamic var wishListCount: Int = 0
    dynamic var tripsCount: Int = 0
    dynamic var teaserBadge: String!
    dynamic var hostingSince: Date!
    dynamic var dataPhoto: Data!
    
    required convenience init?(map: Map) {
        self.init()
    }

    // MARK: Mapping json to object
    func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.city <- map["city"]
        self.country <- map["country"]
        self.rating <- map["rating"]
        self.reviewsCount <- map["reviews_count"]
        self.photoUrl <- map["photo_url"]
        self.price <- map["price"]
        self.url <- map["url"]
        self.accommodationTypeSlug <- map["accommodation_type_slug"]
        self.mealsCount <- map["meals_count"]
        self.wishListCount <- map["wish_list_count"]
        self.tripsCount <- map["trips_count"]
        self.teaserBadge <- map["teaser_badge"]
        self.hostingSince <- (map["hosting_since"], DateTransform())
        
        do {
            // MARK: Transforma Data em UIImage
            if let url = URL(string: self.photoUrl) {
                print(url)
                let imageData = try Data(contentsOf: url)
                self.dataPhoto = imageData
            }
        } catch {
            if let image = UIImage(named: "invalid_image") {
                self.dataPhoto = UIImagePNGRepresentation(image)
            }
        }
        
        
    }
    
}
