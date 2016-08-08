//
//  PlayScene.swift
//  Tracker
//
//  Created by Courtney Osborne on 8/8/16.
//  Copyright © 2016 Stefan. All rights reserved.
//

import SpriteKit


class PlayScene: SKScene {

    override func didMoveToView(view: SKView) {
        
        func didMoveToView(view: SKView) {
            
            // This is copy and pasted code that doesn't work
            // will modify later
            let player = SKSpriteNode(imageNamed: "spark.png")
            let stage = SKSpriteNode(imageNamed: "Level1png")
            
            stage.position = CGPointMake(self.size.width / 2, self.size.height / 2)
            addChild(stage)
        
            }
    }
    
    func explosion(pos: CGPoint) {
        
        let emitterNode = SKEmitterNode(fileNamed: "Level 1.sks")
        
        emitterNode!.particlePosition = pos
        self.addChild(emitterNode!)
        self.runAction(SKAction.waitForDuration(2), completion: { emitterNode!.removeFromParent() })
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }

}