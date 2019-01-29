//
//  MyView.swift
//  Apple Logo Game
//
//  Created by Anthony Jean on 29/01/2019.
//  Copyright © 2019 Anthony Jean. All rights reserved.
//

import UIKit

class MyView: UIView {

    var myMask = UIView()
    var response = Response.maybe
    var imageView: UIImageView?
    var imgLogo: Logo? {
        didSet {
            guard let l = imgLogo else { return }
            response = .maybe
            if imageView == nil {
                imageView = UIImageView(frame: bounds)
                imageView?.image = l.image
                imageView?.contentMode = .scaleAspectFit
                addSubview(imageView ?? UIImageView())
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        setLayer()
        isUserInteractionEnabled = true
        addMask()
    }
    
    func addMask() {
        myMask = UIView(frame: bounds)
        myMask.backgroundColor = .clear
        myMask.alpha = 0.25
        addSubview(myMask)
    }
    
    func setMaskColor(_ response: Response) {
        switch response {
        case .yes: myMask.backgroundColor = .green
        case .no: myMask.backgroundColor = .red
        case .maybe: myMask.backgroundColor = .clear
        }
        
        self.response = response
    }
    
    
    
}
