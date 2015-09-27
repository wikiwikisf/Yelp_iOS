//
//  BusinessCell.swift
//  Yelp
//
//  Created by Vicki Chun Grospe on 9/24/15.
//  Copyright © 2015 Vicki Chun Grospe. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
  
  @IBOutlet weak var thumbImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var reviewsLabel: UILabel!
  @IBOutlet weak var ratingImageView: UIImageView!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var distanceLabel: UILabel!
  
  var business: Business! {
    didSet {
      thumbImageView.setImageWithURL(business.imageURL)
      nameLabel.text = business.name
      ratingImageView.setImageWithURL(business.ratingImageURL)
      reviewsLabel.text = "\(business.reviewCount!) Reviews"
      addressLabel.text = business.address
      typeLabel.text = business.categories
      distanceLabel.text = business.distance
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
    thumbImageView.layer.cornerRadius = 4
    thumbImageView.layer.borderWidth = 0.5
    thumbImageView.layer.borderColor = UIColor.grayColor().CGColor
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
