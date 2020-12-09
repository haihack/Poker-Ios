//
//  HandTableViewCell.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/11/30.
//

import UIKit
import DTTextField

class HandTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet var fieldArray: Array<DTTextField>!
    var defaultBorderColor: UIColor!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        defaultBorderColor = fieldArray[0].borderColor
        for field in fieldArray {
            configTextView(tv: field)
        }
    }
    
    private func configTextView(tv: DTTextField )
    {
        tv.delegate = self
        tv.addTarget(self, action: #selector(handleTextChange(_:)), for: .editingChanged)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let view = textField as! DTTextField
        view.borderColor = UIColor.blue
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let view = textField as! DTTextField
        view.borderColor = defaultBorderColor
    }
    
    @objc fileprivate func handleTextChange(_ textField: DTTextField){
        guard let text = textField.text  else {
           return
        }
        if text.isValid(){
            //todo: hide error icon
            textField.disableRightImage()
            textField.borderColor = UIColor.blue
        }else{
            //todo: show error icon
            textField.enableRightImage()
            textField.borderColor = UIColor.red
        }
    }

}
