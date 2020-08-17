//
//  coreDataTaskTableViewCell.swift
//  14
//
//  Created by iMac on 14/08/2020.
//  Copyright © 2020 iMac. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
  @IBOutlet weak var weatherImage: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var tempLabel: UILabel!
  @IBOutlet weak var pressureLabel: UILabel!
  @IBOutlet weak var mainLabel: UILabel!
  @IBOutlet weak var humidityLabel: UILabel!
  
  
   
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
