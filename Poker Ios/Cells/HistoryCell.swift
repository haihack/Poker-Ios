//
//  HistoryCell.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/08.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var lblRank: UILabel!
    @IBOutlet weak var lblCardNames: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

