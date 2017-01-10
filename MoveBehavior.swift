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
  
  init(agent: [GKAgent], target: [GKAgent],
       obstacles: [GKPolygonObstacle],
       path: [GKGraphNode]) {
    
    super.init()
    
    let cgpath = GKPath(graphNodes: path, radius: 0)
    setWeight(100, for: GKGoal(toStayOn: cgpath, maxPredictionTime: 0.5))
    setWeight(100, for: GKGoal(toFollow: cgpath, maxPredictionTime: 1.5, forward: true))
    //toAvoid sembra non funzioanre ..
    setWeight(200, for: GKGoal(toAvoid: obstacles, maxPredictionTime: 0.5))
    setWeight(1, for: GKGoal(toInterceptAgent: target.first!, maxPredictionTime: 1))
    
  }
  
}
