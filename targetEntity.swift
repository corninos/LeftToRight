//
//  targetEntity.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//

import GameplayKit
import SpriteKit

class targetEntity: GKEntity {
  
  init(entityManager: EntityManager, texture: SKTexture){
    
    super.init()
    
    self.addComponent(VisualComponent(texture: texture, fixed: true))
    self.addComponent(TargetComponent(entityManager: entityManager))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
