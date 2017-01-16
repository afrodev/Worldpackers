//
//  HitViewModel.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 15/01/17.
//  Copyright © 2017 Humberto Vieira. All rights reserved.
//

import Foundation
import UIKit

class HitViewModel {
    private var hit: Hit
    
    init(hit: Hit) {
        self.hit = hit
    }
    
    var id: String {
        return "\(hit.id)"
    }
    
    var title: String {
        return hit.title
    }
    
    var city: String {
        return hit.city
    }
    
    var country: String {
        return hit.country
    }
    
    var rating: String {
        return "\(hit.rating)"
    }
    
    var reviewsCount: String {
        return "\(hit.reviewsCount)"
    }
    
    var photoUrl: String {
        return hit.photoUrl
    }
    
    var price: String {
        return "US$ \(hit.price)"
    }
    
    var url: String {
        return hit.url
    }
    
    var accommodationTypeSlug: String {
        return hit.accommodationTypeSlug
    }
    
    var mealsCount: String {
        return "\(hit.mealsCount)"
    }
    
    var wishListCount: String {
        return "\(hit.wishListCount)"
    }
    
    var tripsCount: String {
        return "\(hit.tripsCount)"
    }

    var teaserBadge: String {
        return hit.teaserBadge
    }
    
    // Put date formatter
    var hostingSince: String {
        return hit.hostingSince.description
    }
    
    var photoImage: UIImage {
        guard let image = UIImage(data: hit.dataPhoto) else {
            return UIImage()
        }
        
        return image
    }
    
}
