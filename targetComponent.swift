//
//  targetComponent.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class TargetComponent : GKAgent2D, GKAgentDelegate {

    let entityManager: EntityManager
    
    init(entityManager: EntityManager) {
        self.entityManager = entityManager
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func agentWillUpdate(_ agent: GKAgent) {
        guard let spriteComponent = entity?.component(ofType: VisualComponent.self) else {
            return
        }
        position = float2(spriteComponent.node.position)
    }
    
    func agentDidUpdate(_ agent: GKAgent) {
        guard let spriteComponent = entity?.component(ofType: VisualComponent.self) else {
            return
        }
        
        spriteComponent.node.position = CGPoint(position)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
        super.update(deltaTime: seconds)
        guard let spriteComponent = entity?.component(ofType: VisualComponent.self) else {
            return
        }
        
        position = float2(spriteComponent.node.position)
    }
    
}
