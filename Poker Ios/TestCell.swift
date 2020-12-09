//
//  TestCellTableViewCell.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/03.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var lbl_txt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
