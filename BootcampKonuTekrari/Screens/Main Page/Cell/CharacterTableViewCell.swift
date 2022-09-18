//
//  CharacterTableViewCell.swift
//  BootcampKonuTekrari
//
//  Created by Mert Demirtaş on 18.09.2022.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var characterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(data: CharacterTableViewCellModel) {
        characterName.text = data.name
        characterImage.kf.setImage(with: URL(string: data.image))
    }
}
