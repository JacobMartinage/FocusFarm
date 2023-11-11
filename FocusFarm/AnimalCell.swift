//
//  AnimalCell.swift
//  FocusFarm
//
//  Created by Jacob Martinage on 11/8/23.
//

import UIKit

class AnimalCell: UITableViewCell {

    @IBOutlet weak var AnimalName: UILabel!
    @IBOutlet weak var AnimalImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
