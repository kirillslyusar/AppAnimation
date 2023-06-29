//
//  ViewController.swift
//  AppAnimation
//
//  Created by Кирилл Слюсарь on 14.06.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    @IBOutlet var coreAnimationView: UIView!
    @IBOutlet var springAnimationView: SpringView!
    
    private var animationStarted = false
    
    @IBAction func startCoreAnimation(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.autoreverse, .repeat]) { [unowned self] in // список захвата
            if !animationStarted {
                coreAnimationView.frame.origin.x -= 40
                animationStarted.toggle()
            }
        }
    }
    
    @IBAction func startSpringAnimation(_ sender: SpringButton) {
        springAnimationView.animation = "shake"
        springAnimationView.curve = "easeIn"
        springAnimationView.force = 2
        springAnimationView.duration = 1
        springAnimationView.delay = 0.3
        springAnimationView.animate()
        
        sender.animation = "swing"
        sender.animate()
    }
    
    
    
    
}

