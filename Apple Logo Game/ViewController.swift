//
//  ViewController.swift
//  Apple Logo Game
//
//  Created by Anthony Jean on 29/01/2019.
//  Copyright © 2019 Anthony Jean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    var logo: MyView?
    var rect = CGRect()
    var buttonYes = MyButton()
    var buttonNo = MyButton()
    var scoreLabel = MyLabel()
    var isGame = false
    var playButton: MyButton?
    var timer = Timer()
    var leftTime = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradient()
        
        container.frame = view.bounds
        rect = CGRect(x: container.frame.midX - 100, y: container.frame.midY - 100, width: 200, height: 200)
        
        setupButtons()
        setupLabel()
        setupGame()

    }
    
    func setupGradient() {
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        view.bringSubviewToFront(container)
        

    }
    
    func setupLabel() {
        scoreLabel = MyLabel(frame: CGRect(x: 20, y: 10, width: container.frame.width - 40, height: 60))
        container.addSubview(scoreLabel)
    }
    
    func setupButtons() {
        let tier = container.frame.width / 3
        let quarter = container.frame.width / 4
        let buttonHeight:CGFloat = 50
        let y = container.frame.height - (buttonHeight * 1.5)
        let buttonSize = CGSize(width: tier, height: buttonHeight)
        buttonYes.frame.size = buttonSize
        buttonYes.center = CGPoint(x: quarter * 3, y: y)
        buttonYes.setup(string: "OUI")
        buttonYes.addTarget(self, action: #selector(yesAction), for: .touchUpInside)
        buttonYes.isHidden = true
        container.addSubview(buttonYes)
        
        buttonNo.frame.size = buttonSize
        buttonNo.center = CGPoint(x: quarter, y: y)
        buttonNo.setup(string: "NON")
        buttonNo.addTarget(self, action: #selector(noAction), for: .touchUpInside)
        buttonNo.isHidden = true
        container.addSubview(buttonNo)
    }
    
    func setupGame() {
        if isGame {
            if playButton != nil {
                playButton?.removeFromSuperview()
                playButton = nil
            }
            
            logo = MyView(frame: rect)
            container.addSubview(logo ?? UIView())
            buttonYes.isHidden = false
            buttonNo.isHidden = false
            
            let boolRandom = Int.random(in: 0...1) % 2 == 0
            logo?.imgLogo = Logo(bool: boolRandom)
        } else {
            if logo != nil {
                logo?.removeFromSuperview()
                logo = nil
            }
            playButton = MyButton(frame: CGRect(x: 40, y: container.frame.height / 2 - 30, width: container.frame.width - 80, height: 60))
            playButton?.setup(string: "Commencer à jouer")
            playButton?.addTarget(self, action: #selector(play), for: .touchUpInside)
            container.addSubview(playButton ?? UIButton())
        }
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == logo?.myMask {
            let xPosition = touch.location(in: container).x
            let distance = container.frame.midX - xPosition
            let angle = -distance / 360
            let tier = container.frame.width / 3
            
            logo?.center.x = xPosition
            logo?.transform = CGAffineTransform(rotationAngle: angle)
            if xPosition < (tier + tier / 3) {
                logo?.setMaskColor(.no)
            } else if xPosition >= (tier + tier / 3) && xPosition < (tier * 2 - tier / 3) {
                logo?.setMaskColor(.maybe)
            } else {
                logo?.setMaskColor(.yes)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == logo?.myMask {
            logo?.transform = CGAffineTransform.identity
            logo?.frame = rect
            logo?.setMaskColor(.maybe)
        }
    }
    
    @objc func yesAction() {
        print("oui")
    }
    
    @objc func noAction() {
        print("non")
    }
    
    @objc func play() {
        isGame = !isGame
        
        if isGame {
            leftTime = 30
            timerFunc()
        }
        setupGame()
    }
    
    func timerFunc() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.leftTime -= 1
            self.scoreLabel.updateText(self.leftTime, self.score)
            if self.leftTime == 0 {
                self.timer.invalidate()
                self.scoreLabel.updateText(nil, nil)
                self.play()
            }
        })
    }

}

