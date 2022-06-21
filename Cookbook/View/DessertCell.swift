//
//  DessertCell.swift
//  Cookbook
//
//  Created by Jafar Asimov on 6/18/22.
//

import UIKit

class DessertCell: UITableViewCell {

    @IBOutlet weak var dessertImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    func configureCell(dessert : Dessert) {
        dessertImageView.image = UIImage(named: dessert.image)
        titleLabel.text = dessert.name
        categoryLabel.text = dessert.category
        timeLabel.text = dessert.time
        descriptionLabel.text = dessert.description
    }
    
}
