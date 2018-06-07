//
//  GameScene.swift
//  Pong
//
//  Created by MPP on 22/5/18.
//  Copyright © 2018 Matthew Purcell. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var bottomPaddle: SKSpriteNode?
    var fingerOnBottomPaddle: Bool = false
    
    var topPaddle: SKSpriteNode?
    var fingerOnTopPaddle: Bool = false
    
    var ball: SKSpriteNode?
    
    override func didMove(to view: SKView) {
      
        bottomPaddle = childNode(withName: "bottomPaddle") as? SKSpriteNode
        bottomPaddle!.physicsBody = SKPhysicsBody(rectangleOf: bottomPaddle!.frame.size)
        bottomPaddle!.physicsBody!.isDynamic = false
        
        topPaddle = childNode(withName: "topPaddle") as? SKSpriteNode
        topPaddle!.physicsBody = SKPhysicsBody(rectangleOf: topPaddle!.frame.size)
        topPaddle!.physicsBody!.isDynamic = false
        
        ball = childNode(withName: "ball") as? SKSpriteNode
        ball!.physicsBody = SKPhysicsBody(rectangleOf: ball!.frame.size)
        ball!.physicsBody!.friction = 0
        ball!.physicsBody!.restitution = 1
        ball!.physicsBody!.linearDamping = 0
        ball!.physicsBody!.angularDamping = 0
        ball!.physicsBody!.allowsRotation = false
        
        //physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if touchedNode.name == "bottomPaddle" {
            fingerOnBottomPaddle = true
        }
        
        if touchedNode.name == "topPaddle" {
            fingerOnTopPaddle = true
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let previousTouchLocation = touch.previousLocation(in: self)
        
        if fingerOnBottomPaddle == true && touchLocation.y < 0 {
        
            let paddleX = bottomPaddle!.position.x + (touchLocation.x - previousTouchLocation.x)
        
            if (paddleX - bottomPaddle!.size.width / 2) > -(self.size.width / 2) &&
                (paddleX + bottomPaddle!.size.width / 2) < (self.size.width / 2) {
            
                bottomPaddle!.position = CGPoint(x: paddleX, y: -560.0)
                
            }
            
        }
        
        if fingerOnTopPaddle == true && touchLocation.y > 0 {
            
            let paddleX = topPaddle!.position.x + (touchLocation.x - previousTouchLocation.x)
            
            if (paddleX - topPaddle!.size.width / 2) > -(self.size.width / 2) &&
                (paddleX + topPaddle!.size.width / 2) < (self.size.width / 2) {
                
                topPaddle!.position = CGPoint(x: paddleX, y: 560.0)
                
            }
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if fingerOnBottomPaddle == true {
            
            fingerOnBottomPaddle = false
            
        }
        
        if fingerOnTopPaddle == true {
            
            fingerOnTopPaddle = false
            
        }
        
    }
    
}










