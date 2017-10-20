//
//  ViewControllerTableViewCell.swift
//  Project4
//
//  Created by Mac on 2017/10/20.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
  
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var email: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
