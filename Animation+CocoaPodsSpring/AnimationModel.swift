//
//  AnimationModel.swift
//  Animation+CocoaPodsSpring
//
//  Created by Екатерина Боровкова on 24.06.2021.
//

import Foundation
import Spring

struct AnimationModel {
    let animation: Spring.AnimationPreset
    let animationCurve: Spring.AnimationCurve
    
    static func getAnimatinModel() -> [AnimationModel] {
        var arrayOfAnimation : [AnimationModel] = []
        var index = 0
        let repetingCount =  min(AnimationDataManager.shared.animations.count, AnimationDataManager.shared.animationCurves.count) - 1
        for _ in 0...repetingCount {
           
            arrayOfAnimation.append(AnimationModel(animation: AnimationDataManager.shared.animations[index] , animationCurve: AnimationDataManager.shared.animationCurves[index]))
            index += 1
        }
        
        return arrayOfAnimation
    }
}
