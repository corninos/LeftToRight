//
//  GameScene.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entityManager: EntityManager!
    var lastUpdateTimeInterval: TimeInterval = 0
    
    override func didMove(to view: SKView) {
        entityManager = EntityManager(scene: self) //Genero il gestore delle entità
        entityManager.SpawnTarget()
    }
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
       entityManager.update(deltaTime: deltaTime)

    }

    
    var primotocco = 0
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            if primotocco < 1 {
//                primotocco += 1
//            print(touch.location(in: self))
            let obstacles: [GKPolygonObstacle] = SKNode.obstacles(fromNodePhysicsBodies: self["wall/*"] as! [SKSpriteNode])
            let graph = GKObstacleGraph(obstacles: obstacles, bufferRadius: 101)
            
            // Create a node for the user's current position, and the user's destination.
            let startNode = GKGraphNode2D(point: float2(touch.location(in: self)))
            let endNode = GKGraphNode2D(point: entityManager.targetComponents()[0].position)
            
            
            // Connect the two nodes just created to graph.
            graph.connectUsingObstacles(node: startNode)
            graph.connectUsingObstacles(node: endNode)
            
            // Find a path from the start node to the end node using the graph.
            let path:[GKGraphNode] = graph.findPath(from: startNode, to: endNode)
            guard path.count > 0 else { return }
            entityManager.spawnPlayer(position: touch.location(in: self), obstacles: obstacles ,path: path)
   //disenga linee percorso
            var converted =  [CGPoint]()
            for node:GKGraphNode in path {
                if let point2d = node as? GKGraphNode2D {
                    let point = CGPoint(x: CGFloat(point2d.position.x), y: CGFloat(point2d.position.y))
                    converted.append(point)
                }
            }
            var converted2 = [CGPoint]()
            converted2.append(converted[0])
            converted2.append(converted[1])
            
            let pathline = SKShapeNode(points: &converted,
                                       count: converted.count)
            pathline.lineWidth = CGFloat(10) * 2
            pathline.zPosition = 2
            pathline.name = "linea"
            pathline.alpha = 0.1
            
            pathline.strokeColor = UIColor.yellow
            
//            self.addChild(pathline)
            }else{
                entityManager.spara()
            }
        }

    }
}
