//
//  AnimationDataManager.swift
//  Animation+CocoaPodsSpring
//
//  Created by Екатерина Боровкова on 24.06.2021.
//

import Foundation
import Spring

class AnimationDataManager {
    
  static let shared = AnimationDataManager()
    
     let animations: [Spring.AnimationPreset] = [
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

    var animationCurves: [Spring.AnimationCurve] = [
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
    private init() {}
}
