//
//  FilterDropDownCell.swift
//  Yelp
//
//  Created by Vicki Chun Grospe on 9/26/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FilterDropDownCell: UITableViewCell {
  
  @IBOutlet weak var filterLabel: UILabel!
  @IBOutlet weak var dropDownImage: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
