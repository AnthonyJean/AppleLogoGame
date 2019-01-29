//
//  MyLabel.swift
//  Apple Logo Game
//
//  Created by Anthony Jean on 29/01/2019.
//  Copyright © 2019 Anthony Jean. All rights reserved.
//

import UIKit

class MyLabel: UILabel {
    
    private var _font: UIFont = UIFont.systemFont(ofSize: 20)
    private var _color: UIColor = UIColor.white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        textColor = UIColor.white
        numberOfLines = 0
        textAlignment = NSTextAlignment.center
        adjustsFontSizeToFitWidth = true
        font = UIFont.systemFont(ofSize: 20)
        updateText(nil, nil)
    }
    
    func updateText(_ leftTime: Int?, _ score: Int?) {
        let gameText = "Est-ce un logo Apple ?"
        
        if leftTime == nil && score == nil {
            text = gameText
        } else {
            let attributes = NSMutableAttributedString(string: gameText + "\n", attributes: [
                NSAttributedString.Key.foregroundColor : _color,
                NSAttributedString.Key.font: _font
                ])
            attributes.append(NSAttributedString(string: "Temps restant : \(leftTime!) - Score: \(score!)",
                attributes: [
                    .foregroundColor: UIColor.red,
                    .font: UIFont.boldSystemFont(ofSize: 24)]))
            attributedText = attributes
        }
    }
    
}
