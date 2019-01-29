//
//  MyButton.swift
//  Apple Logo Game
//
//  Created by Anthony Jean on 29/01/2019.
//  Copyright © 2019 Anthony Jean. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    
    func setup(string: String) {
        setLayer()
        setTitle(string, for: UIControl.State.normal)
        setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
    }
}
