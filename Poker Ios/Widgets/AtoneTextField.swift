//
//  AtoneTextField.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/09.
//

import Foundation
import DTTextField

//refer: https://valv0.medium.com/computed-properties-and-extensions-a-pure-swift-approach-64733768112c
extension DTTextField {
    
    func getFieldIndex(id: String) -> Int {
        switch id {
        case "field1":
            return 0
        case "field2":
            return 1
        case "field3":
            return 2
        case "field4":
            return 3
        case "field5":
            return 4
        default:
            print("\(id) not found")
            return 0
        }
    }
    
    func enableRightImage(){
        let homeSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 55, weight: .black)
        let imageView = UIImageView(frame: CGRect(x: -10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(systemName: "exclamationmark.circle.fill", withConfiguration: homeSymbolConfiguration)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageContainerView.addSubview(imageView)
        rightView = imageContainerView
        rightViewMode = .always
        self.tintColor = .red
    }
    
    func disableRightImage(){
        rightViewMode = .never
    }
}
