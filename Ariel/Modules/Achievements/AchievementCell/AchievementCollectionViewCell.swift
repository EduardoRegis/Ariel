//
//  AchievementCollectionViewCell.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 24/02/23.
//

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var achievementImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(name: String?) {
        titleLabel.text = name
        achievementImage.image = UIImage(systemName: "trophy.fill")
    }
}

