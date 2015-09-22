//
//  BusinessCell.swift
//  Yelp
//
//  Created by Vijayalakshmi Subramanian on 9/21/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    
   
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
     
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    var business:    Business! {
        didSet {
            nameLabel.text = business.name
            categoriesLabel.text = business.categories
            addressLabel.text = business.address
            reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
            thumbImageView.setImageWithURL(business.imageURL)
            ratingImageView.setImageWithURL(business.ratingImageURL)
            distanceLabel.text = business.distance
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbImageView.layer.cornerRadius = 5
        thumbImageView.clipsToBounds = true
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
         nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
