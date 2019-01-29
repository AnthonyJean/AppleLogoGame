//
//  ExtensionView.swift
//  Apple Logo Game
//
//  Created by Anthony Jean on 29/01/2019.
//  Copyright © 2019 Anthony Jean. All rights reserved.
//

import UIKit

extension UIView {
    
    func setLayer() {
        backgroundColor = .white
        layer.cornerRadius = 8
        //layer.borderColor = UIColor.red.cgColor
        //layer.borderWidth = 2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
}
