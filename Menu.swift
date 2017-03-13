//
//  Menu.swift
//  ScreenChanges
//
//  Created by GrownYoda on 2/16/17.
//  Copyright © 2017 YuryG. All rights reserved.
//

import SpriteKit

var topScore = 0
var currentScore = 0
var lastScore = 0


class Menu: SKScene {

    var labelLastScore: SKLabelNode?
    var labelTopScore: SKLabelNode?
    
    override func didMove(to view: SKView) {        
        
        labelLastScore = self.childNode(withName: "LabelLastScore") as? SKLabelNode
        labelLastScore?.text = "Last Score: " + "\(currentScore)"
        

        labelLastScore = self.childNode(withName: "LabelTopScore") as? SKLabelNode
        labelLastScore?.text = "Top Score: " + "\(topScore)"

        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        labelLastScore?.text = "Last Score: " + "\(currentScore)"
        labelLastScore?.text = "Top Score: " + "\(topScore)"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        moveToGameScene(sceneName: "GameScene")
        
    }
    
    func moveToGameScene(sceneName: String) {
        
        let scene = GameScene(fileNamed: sceneName)
        let skView = self.view as SKView?
        scene?.scaleMode = .aspectFill
        skView?.presentScene(scene)
    }
    
}
