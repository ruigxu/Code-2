//
//  GameScene.swift
//  ScreenChanges
//
//  Created by GrownYoda on 2/16/17.
//  Copyright © 2017 YuryG. All rights reserved.
//

import SpriteKit
import GameplayKit




class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    
    //define properties with a "?"
    var player: SKSpriteNode?   //optional "nil"
    var ball: SKSpriteNode?   //optional "nil"
    var LabelScore: SKLabelNode?
    
    //  didMove to View
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        print("Hello I'm in didMove to view")  //"format a string"
        
        
        
        // as is "casting"
        player = self.childNode(withName: "greenPaddle") as! SKSpriteNode?
        ball = self.childNode(withName: "TanPingPongBall") as! SKSpriteNode?

        
        playSoundPongBall()
        
        LabelScore = self.childNode(withName: "LabelScore") as? SKLabelNode
        
        // set up
        self.physicsWorld.contactDelegate = self
        
        
        currentScore = 0
    
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
        
        for  t in touches {
            print("t= \(t.location(in: self))")
            
            // move player's X position to that point.
            player?.position.x = t.location(in: self).x
          //  player?.position.y = t.location(in: self).y
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches moved")
        
        
        for  t in touches {
            // print out where the finger touched
            print("t= \(t.location(in: self))")
            
            // move player's X position to that point.
            player?.position.x = t.location(in: self).x
         //   player?.position.y = t.location(in: self).y

   
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches ended")
        
        
        for  t in touches {
            // print out where the finger touched
            print("t= \(t.location(in: self))")
            
            // move player's X position to that point.
            player?.position.x = t.location(in: self).x
       //     player?.position.y = t.location(in: self).y
       
            
        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if (contact.bodyB.node?.name == "bottomWall" || contact.bodyA.node?.name == "bottomWall"){
            print("Bottom Hit, Game Over")
            
            lastScore = currentScore
            if (topScore < lastScore){
                topScore = lastScore
            }
            
            // Load the SKScene from 'GameScene.sks'
                moveToSceneWith(sceneName: "GameOverScreen")
            }

        
        
        if (contact.bodyB.node?.name == "greenPaddle" || contact.bodyA.node?.name == "greenPaddle"){
            print("Ping, add Point")
            playSoundPongBall()
            ball?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 400))
         
        
            
        }
        
        if (contact.bodyB.node?.name == "TanPingPongBall" || contact.bodyA.node?.name == "TanPingPongBall"){
            print("Ball Hit something, do nothing for now")
           
        }

        if (contact.bodyB.node?.name == "topWall" || contact.bodyA.node?.name == "topWall"){
            print("Hit TopWall")
            playSoundHitWall()
            currentScore = currentScore + 1
            LabelScore?.text = "Hits: \(currentScore)"
        }

        
    }

    func pushBallUp(){
        
    }
    
    func playSoundPongBall(){
        player?.run(SKAction.playSoundFileNamed("jg-032316-sfx-ping-pong-paddle-hitting-ball.mp3",waitForCompletion:false));

    }
    
    func playSoundHitWall(){
        player?.run(SKAction.playSoundFileNamed("bottles-clink-1_Gk_ETbEO.mp3",waitForCompletion:false));

        
    }
    
    func playSoundGameEnd(){
        
    }

func moveToSceneWith(sceneName: String) {
    
    let scene = GameScene(fileNamed: sceneName)
    let skView = self.view as SKView?
    scene?.scaleMode = .aspectFill
    skView?.presentScene(scene)
}


}
