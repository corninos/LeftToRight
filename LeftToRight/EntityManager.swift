//
//  EntityManager.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//

import SpriteKit
import GameplayKit

class EntityManager {
  
  var entities = Set<GKEntity>()
  var scene: SKScene
  
  lazy var componentSystems: [GKComponentSystem] = {
    let moveSystem = GKComponentSystem(componentClass: MoveComponent.self)
    let targetSystem = GKComponentSystem(componentClass: TargetComponent.self)
    
    return [moveSystem, targetSystem]
  }()
  
  init(scene: SKScene) {
    self.scene = scene
  }
  
  let fireRate = 50
  var lastFire = 0
  
  func update(deltaTime: CFTimeInterval) {
    
    lastFire += 1
    
    for componentSystem in componentSystems {
      componentSystem.update(deltaTime: deltaTime)
    }
    
    if lastFire == fireRate {
      lastFire = 0
      for entity in entities{
        if let moveA = entity.component(ofType: MoveComponent.self) {
          for entityB in entities {
            if let moveB = entityB.component(ofType: MoveComponent.self){
              if  (CGPoint(moveA.position) - CGPoint(moveB.position)).length() > 0 &&
                (CGPoint(moveA.position) - CGPoint(moveB.position)).length() < 150 &&
                CGPoint(moveA.position).x <  CGPoint(moveB.position).x
              {
                print("sparo")
                if let move = entity.component(ofType: MoveComponent.self),
                  let fire = entity.component(ofType: FireComponent.self)
                {
                  scene.addChild(fire.fire(location: CGPoint(move.position), rotation: CGFloat(move.rotation)))
                }
                
              }
            }
          }
        }
      }
    }
  }
  
  func moveComponents() -> [MoveComponent] {
    var moveComponents = [MoveComponent]()
    for entity in entities {
      if let moveComponent = entity.component(ofType: MoveComponent.self) {
        moveComponents.append(moveComponent)
      }
    }
    return moveComponents
  }
  
  func targetComponents() -> [TargetComponent] {
    var targetComponents = [TargetComponent]()
    for entity in entities {
      if let TargetComponent = entity.component(ofType: TargetComponent.self){
        targetComponents.append(TargetComponent)
      }
    }
    return targetComponents
  }
  
  func add(entity: GKEntity) {
    entities.insert(entity)
    if let spriteNode = entity.component(ofType: VisualComponent.self)?.node {
      scene.addChild(spriteNode)
    }
    for componentSystem in componentSystems {
      componentSystem.addComponent(foundIn: entity)
    }
  }
  
  func remove(entity: GKEntity) {
    if let spriteNode = entity.component(ofType: VisualComponent.self)?.node {
      spriteNode.removeFromParent()
    }
    entities.remove(entity)
  }
  
  func spawnPlayer(position: CGPoint, obstacles: [GKPolygonObstacle],path: [GKGraphNode]){
    let player = playerEntity(entityManager: self, texture: SKTexture(imageNamed: "Spaceship"), obstacles: obstacles ,path: path)
    if let spriteComponent = player.component(ofType: VisualComponent.self) {
      spriteComponent.node.position = position
      
    }
    add(entity: player)
  }
  
  func removePlayer(){
    if entities.count > 0 {
      remove(entity: entities.first!)
    }
  }
  
  func SpawnTarget(){
    let target = targetEntity(entityManager: self, texture: SKTexture(imageNamed: "Target"))
    if let spriteComponent = target.component(ofType: VisualComponent.self) {
      spriteComponent.node.position = CGPoint(x: 2810, y: 800)
    }
    add(entity: target)
  }
  
  func spara(){
    for entity in entities{
      if let move = entity.component(ofType: MoveComponent.self),
        let fire = entity.component(ofType: FireComponent.self) {
        scene.addChild(fire.fire(location: CGPoint(move.position), rotation: CGFloat(move.rotation)))
      }
    }
  }
  
}
