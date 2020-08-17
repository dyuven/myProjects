//
//  TaskTableViewCell.swift
//  14
//
//  Created by iMac on 13/08/2020.
//  Copyright © 2020 iMac. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

  @IBOutlet weak var task1Label: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
