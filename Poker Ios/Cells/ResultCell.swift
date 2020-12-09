//
//  ResultCell.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/07.
//

import UIKit

class ResultCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var handType: UILabel!
    @IBOutlet weak var cards: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
