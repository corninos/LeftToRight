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
    
    var node: SKSpriteNode
    init(texture: SKTexture,fixed: Bool){
        self.node = SKSpriteNode(texture: texture, size: CGSize(width: 100, height: 100))
        if !fixed {
            self.node.physicsBody = SKPhysicsBody(circleOfRadius: 65)//(texture: texture , size: node.size )
            self.node.physicsBody!.affectedByGravity = false
        }
        super.init()
       // self.node.addChild(oneLittleCircle())

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func oneLittleCircle() -> SKNode{
        
        let Circle = SKShapeNode(circleOfRadius: 65 ) // Size of Circle
        Circle.position = CGPoint(x: 0, y: 0) //Middle of Screen
        Circle.fillColor = SKColor.red
        return Circle
    }
}
