//
//  MoveBehavior.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//

import GameplayKit
import SpriteKit

class MoveBehavior: GKBehavior {
    
    init(agent: [GKAgent], target: [GKAgent], obstacles: [GKPolygonObstacle], path: [GKGraphNode]) {
        super.init()

        let cgpath = GKPath(graphNodes: path, radius: 0)
        setWeight(20, for: GKGoal(toStayOn: cgpath, maxPredictionTime: 1))
        setWeight(25, for: GKGoal(toFollow: cgpath, maxPredictionTime: 1, forward: true))
        //setWeight(9, for: GKGoal(toAvoid: obstacles, maxPredictionTime: 10))
        setWeight(15, for: GKGoal(toAvoid: agent, maxPredictionTime: 0.5))
        setWeight(1, for: GKGoal(toInterceptAgent: target.first!, maxPredictionTime: 1))

    }
    
}
