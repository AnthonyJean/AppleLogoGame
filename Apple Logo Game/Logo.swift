//
//  Logo.swift
//  Apple Logo Game
//
//  Created by Anthony Jean on 29/01/2019.
//  Copyright © 2019 Anthony Jean. All rights reserved.
//

import UIKit

class Logo {
    private var _appleImages: [UIImage?] = [UIImage(named: "apple 1"), UIImage(named: "apple 2")]
    private var _otherImages: [UIImage?] = [UIImage(named: "android"), UIImage(named: "windows")]
    
    private var _image: UIImage?
    private var _isApple: Bool
    
    var image: UIImage? {
        return _image
    }
    
    var isApple: Bool {
        return _isApple
    }
    
    init(bool: Bool) {
        _isApple = bool
        let random = Int.random(in: 0...1)
        _image = _isApple ? _appleImages[random] : _otherImages[random]
    }
}
