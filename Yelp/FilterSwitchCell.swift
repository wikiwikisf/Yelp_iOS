//
//  DealSwitchCell.swift
//  Yelp
//
//  Created by Vicki Chun Grospe on 9/26/15.
//  Copyright © 2015 Vicki Chun Grospe. All rights reserved.
//

import UIKit

protocol FilterSwitchCellDelegate: class {
  func filterSwitchCellToggled(filterSwitchCell: FilterSwitchCell, didChangeValue value: Bool?)
}

class FilterSwitchCell: UITableViewCell {
  
  @IBOutlet weak var filterLabel: UILabel!
  @IBOutlet weak var onSwitch: UISwitch!
  weak var delegate: FilterSwitchCellDelegate?
  
  @IBAction func switchValueChanged(sender: AnyObject) {
    print("switch value changed")
    delegate?.filterSwitchCellToggled(self, didChangeValue: onSwitch.on)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
