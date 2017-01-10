//
//  moveComponent.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//

import SpriteKit
import GameplayKit

class MoveComponent : GKAgent2D {
  
  let entityManager: EntityManager
  let obstacles: [GKPolygonObstacle]
  let path: [GKGraphNode]
  
  init(maxSpeed: Float,
       maxAcceleration: Float,
       radius: Float,
       entityManager: EntityManager,
       obstacles: [GKPolygonObstacle],
       path: [GKGraphNode]) {
    
    self.entityManager = entityManager
    self.obstacles = obstacles
    self.path = path
    super.init()
    delegate = self
    self.maxSpeed = maxSpeed
    self.maxAcceleration = maxAcceleration
    self.radius = radius
    print(self.radius)
    self.mass = 1
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func update(deltaTime seconds: TimeInterval) {
    super.update(deltaTime: seconds)
    
    let component = entityManager.moveComponents()
    let target = entityManager.targetComponents()
    behavior = MoveBehavior(agent: component, target: target, obstacles: obstacles, path: path)

  }
  
}

extension MoveComponent: GKAgentDelegate {
  
  func agentWillUpdate(_ agent: GKAgent) {
    guard let spriteComponent = entity?.component(ofType: VisualComponent.self) else {
      return
    }
    position = float2(spriteComponent.node.position)
    rotation = Float(spriteComponent.node.zRotation + .pi / 2)
  }
  
  func agentDidUpdate(_ agent: GKAgent) {
    guard let spriteComponent = entity?.component(ofType: VisualComponent.self) else {
      return
    }
    spriteComponent.node.position = CGPoint(position)
    spriteComponent.node.zRotation = CGFloat(rotation) - .pi / 2
  }
  
}
