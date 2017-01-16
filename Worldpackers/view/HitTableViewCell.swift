//
//  HitTableViewCell.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 27/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class HitTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCityCountry: UILabel!
    @IBOutlet var imageViewArrayStar: [UIImageView]!
    @IBOutlet weak var labelAccommodation: UILabel!
    @IBOutlet weak var labelMeals: UILabel!
    @IBOutlet weak var labelWishList: UILabel!
    @IBOutlet weak var labelTrips: UILabel!
    @IBOutlet weak var labelPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Configure tableviewcell
    func configure(hit: HitViewModel) {
        
        self.imageViewPhoto.image = hit.photoImage
        self.labelTitle.text = hit.title
        self.labelCityCountry.text = hit.city + ", " + hit.country
        
        if let rating = Int(hit.rating) {
            self.configStars(rating: rating)
        }
        
        self.labelAccommodation.text = hit.accommodationTypeSlug
        self.labelMeals.text = hit.mealsCount
        self.labelWishList.text = hit.wishListCount
        self.labelTrips.text = hit.tripsCount
        self.labelPrice.text = hit.price
    }
    
    // MARK: algorithm to show stars on cell
    private func configStars(rating: Int) {
        // 0 to hide all stars
        if rating == 0 {
            for i in imageViewArrayStar {
                i.isHidden = true
            }
        // 1 or more to show stars
        } else if rating >= 1 {
            for i in imageViewArrayStar {
                i.image = UIImage(named: "star_off")
                i.isHidden = false
            }
            
            for i in 1...rating {
                self.imageViewArrayStar[i - 1].image = UIImage(named: "star_on")
            }
        }
        
    }

}
