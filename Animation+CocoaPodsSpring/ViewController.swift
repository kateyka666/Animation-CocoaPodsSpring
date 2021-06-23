//
//  ViewController.swift
//  Animation+CocoaPodsSpring
//
//  Created by Екатерина Боровкова on 22.06.2021.
//

import UIKit
import Spring

class ViewController: UIViewController {

    @IBOutlet weak var animationNameLabel: UILabel!
    @IBOutlet weak var animationTextView: UITextView!
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var switchAnimationButton: SpringButton!
    
   private var index = 0

   private let animations: [Spring.AnimationPreset] = [
        .Shake,
        .Pop,
        .Morph,
        .Squeeze,
        .Wobble,
        .Swing,
        .FlipX,
        .FlipY,
        .Fall,
        .SqueezeLeft,
        .SqueezeRight,
        .SqueezeDown,
        .SqueezeUp,
        .SlideLeft,
        .SlideRight,
        .SlideDown,
        .SlideUp,
        .FadeIn,
        .FadeOut,
        .FadeInLeft,
        .FadeInRight,
        .FadeInDown,
        .FadeInUp,
        .ZoomIn,
        .ZoomOut,
        .Flash
   ].shuffled()

   private var animationCurves: [Spring.AnimationCurve] = [
        .EaseIn,
        .EaseOut,
        .EaseInOut,
        .Linear,
        .Spring,
        .EaseInSine,
        .EaseOutSine,
        .EaseInOutSine,
        .EaseInQuad,
        .EaseOutQuad,
        .EaseInOutQuad,
        .EaseInCubic,
        .EaseOutCubic,
        .EaseInOutCubic,
        .EaseInQuart,
        .EaseOutQuart,
        .EaseInOutQuart,
        .EaseInQuint,
        .EaseOutQuint,
        .EaseInOutQuint,
        .EaseInExpo,
        .EaseOutExpo,
        .EaseInOutExpo,
        .EaseInCirc,
        .EaseOutCirc,
        .EaseInOutCirc,
        .EaseInBack,
        .EaseOutBack,
        .EaseInOutBack
   ].shuffled()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
    
        animationView.layer.cornerRadius = animationView.frame.width / 2
        switchAnimationButton.layer.cornerRadius = 10
    }
    
    @IBAction func switchAnimationButtonPressed(_ sender: SpringButton) {

        //       проверяем сколько анимаций мы можем использовать,потому что массивы содержат разное кол-во элементов
        let repetingCount = min(animations.count,animationCurves.count) - 1
        if index < repetingCount {
        animationView.animation = animations[index].rawValue
        animationView.curve = animationCurves[index].rawValue
            sender.setTitle(animations[index+1].rawValue, for: .normal)
            index += 1
            animationView.animate()
        } else if index == repetingCount {
            sender.setTitle("Start", for: .normal)
            index = 0
            reset()
        }
        
        createTextViewAndLabel()
        
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        switchAnimationButton.setTitle("Start", for: .normal)
        reset()
    }
}

extension ViewController {
    private func createTextViewAndLabel() {
       
        if animationView.animation != "" {
            animationNameLabel.text = animationView.animation
        }
        
        var codeText: String = ""
        if animationView.curve != "" {
            codeText += "curve = \"\(animationView.curve)\"\n"
        }
        if animationView.force != 1 {
            codeText += String(format: "force =  %.1f\n", Double(animationView.force))
        }
        if animationView.duration != 0.7 {
            codeText += String(format: "duration =  %.1f\n", Double(animationView.duration))
        }
        if animationView.delay != 0 {
            codeText += String(format: "delay =  %.1f\n", Double(animationView.delay))
        }
        if animationView.scaleX != 1 {
            codeText += String(format: "scaleX =  %.1f\n", Double(animationView.scaleX))
        }
        if animationView.scaleY != 1 {
            codeText += String(format: "scaleY =  %.1f\n", Double(animationView.scaleY))
        }
        if animationView.rotate != 0 {
            codeText += String(format: "rotate =  %.1f\n", Double(animationView.rotate))
        }
        if animationView.damping != 0.7 {
            codeText += String(format: "damping =  %.1f\n", Double(animationView.damping))
        }
        if animationView.velocity != 0.7 {
            codeText += String(format: "velocity =  %.1f\n", Double(animationView.velocity))
        }
        animationTextView.text = codeText
    }
    private func reset() {
        animationView.force = 1
        animationView.delay = 0
        animationView.duration = 1
        animationView.damping = 0.7
        animationView.velocity = 0.7
        animationView.scaleX = 1
        animationView.scaleY = 1
        animationView.x = 0
        animationView.y = 0
        animationView.rotate = 0.3
        
        animationView.animation = "fall"
        animationView.curve = animationCurves[0].rawValue
        animationView.animate()
        
        animationTextView.text = "It was reset👩‍💻\n Buy, buy!"
    }
}

