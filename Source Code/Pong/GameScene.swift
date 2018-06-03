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
    
    override func didMove(to view: SKView) {
      
        bottomPaddle = childNode(withName: "bottomPaddle") as? SKSpriteNode
        
        topPaddle = childNode(withName: "topPaddle") as? SKSpriteNode
        
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










