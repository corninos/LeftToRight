//
//  extensions.swift
//  LeftToRight
//
//  Created by Corninos on 06/01/17.
//  Copyright © 2017 Corninos. All rights reserved.
//
import Foundation
import CoreGraphics
import GameplayKit

extension CGPoint { //converte float2 in CGPoint
  init(_ point: float2) {
    x = CGFloat(point.x)
    y = CGFloat(point.y)
  }
}

extension float2 { //converte CGPoint in float2
  init(_ point: CGPoint) {
    self.init(x: Float(point.x), y: Float(point.y))
  }
}

extension CGFloat { //restituisce numero casualec o casuale tra d2 valori
  static func random() -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(UInt32.max))
  }
  
  static func random( min: CGFloat, max: CGFloat) -> CGFloat {
    assert(min < max)
    return CGFloat.random() * (max - min) + min
  }
}

func createVector (angle: CGFloat, speed: CGFloat) -> CGVector{
  return CGVector(dx: sin(angle) *  -speed, dy: cos(angle) *  speed)
}

extension CGPoint {
  func length() -> CGFloat {
    return sqrt(x*x + y*y)
  }
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
