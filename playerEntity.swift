//
//  playerEntity.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//

import GameplayKit
import SpriteKit

class playerEntity: GKEntity {
    
    init(entityManager: EntityManager, texture: SKTexture, obstacles: [GKPolygonObstacle] ,path: [GKGraphNode]){
        super.init()
        self.addComponent(VisualComponent(texture: texture,fixed: false))
        self.addComponent(MoveComponent(maxSpeed: 40, maxAcceleration: 10, radius: 70, entityManager: entityManager, obstacles: obstacles, path: path))
        self.addComponent(FireComponent())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
