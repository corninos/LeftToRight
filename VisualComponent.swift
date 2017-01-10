//
//  VisualComponent.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//

import GameplayKit
import SpriteKit

class VisualComponent: GKComponent {
  
  let circleRadius: CGFloat = 40
  var node: SKSpriteNode
  
  init(texture: SKTexture, fixed: Bool){
    self.node = SKSpriteNode(texture: texture,
                             size: CGSize(width: 70, height: 70))
    
    if !fixed {
      self.node.physicsBody = SKPhysicsBody(circleOfRadius: circleRadius)//(texture: texture , size: node.size )
      self.node.physicsBody!.affectedByGravity = false
    }
    
    super.init()
    
    self.node.zRotation = CGFloat(arc4random_uniform(7))
    self.node.addChild(oneLittleCircle(radius: circleRadius))
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func oneLittleCircle(radius: CGFloat) -> SKNode {
    let circle = SKShapeNode(circleOfRadius: radius ) // Size of Circle
    circle.position = CGPoint(x: 0, y: 0)
    circle.fillColor = SKColor.red
    return circle
  }
  
}
