//
//  VisualComponent.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//

import GameplayKit
import SpriteKit

class FireComponent: GKComponent {
    
    override init(){
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func fire(location: CGPoint, rotation: CGFloat) -> SKSpriteNode{
        let newrotation = rotation - 0.5 * .pi
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.size = CGSize(width: 14, height: 19)
        bullet.size = CGSize(width: bullet.size.width, height: bullet.size.height)

        bullet.position = CGPoint(x: location.x + cos(newrotation -  0.5 * .pi) * -100 , y:location.y + sin(newrotation - 0.5 * .pi) * -100)
        bullet.name = "bullet"
        bullet.zRotation = newrotation
        bullet.userData = NSMutableDictionary()
        bullet.userData?.setValue(1, forKey: "rimbalzi")        // Physics
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
        bullet.physicsBody!.linearDamping = 0
        bullet.physicsBody!.angularDamping = 0
        bullet.physicsBody!.restitution = 1.0
        bullet.physicsBody!.friction = 0
        bullet.physicsBody!.collisionBitMask = 0b0010
        bullet.physicsBody!.contactTestBitMask = 0b1111
        bullet.physicsBody!.allowsRotation = false
        bullet.physicsBody!.usesPreciseCollisionDetection = true
        bullet.physicsBody!.velocity = createVector(angle: bullet.zRotation, speed: 1000)
        return bullet
        

    }
}
