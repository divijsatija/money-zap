//
//  GameScene.swift
//  Money Zap
//
//  Created by Divij Satija on 19/04/16.
//  Copyright (c) 2016 Divij Satija. All rights reserved.
//

import SpriteKit

var scoreNumber = 0

class GameScene: SKScene
{
    var zip = 0
    let scoreLabel = SKLabelNode(fontNamed: "Shoemaker")
    
    let playCorrectSoundEffect = SKAction.playSoundFileNamed("Click.mp3", waitForCompletion: false)
    let playGameOverSoundEffect = SKAction.playSoundFileNamed("GameOverSound.mp3", waitForCompletion: false)
    
    let gameArea: CGRect
    
    override init(size: CGSize)
    {
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth)/2
        gameArea = CGRect(x: gameAreaMargin, y: 0, width: playableWidth, height: size.height)
        
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat
    {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat
    {
        return random() * (max-min) + min
    }
    
    
    override func didMoveToView(view: SKView)
    {
        scoreNumber = 0
        
        let background = SKSpriteNode(imageNamed: "background.jpg")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let money = SKSpriteNode(imageNamed: "Money1")
        money.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        money.zPosition = 2
        self.addChild(money)
        money.name = "moneyObject1"
        
        scoreLabel.fontSize = 150
        scoreLabel.text = "$0"
        scoreLabel.fontColor = UIColor(red: 0.40, green: 0.95, blue: 0.98, alpha: 1)
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        self.addChild(scoreLabel)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        for touch: AnyObject in touches
        {
            let positionOfTouch = touch.locationInNode(self)
            let tappedNode = nodeAtPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if nameOfTappedNode == "moneyObject1"
            {
                tappedNode.name = ""
                
                tappedNode.removeAllActions()
                
                tappedNode.runAction(SKAction.sequence([
                    SKAction.fadeOutWithDuration(0.1),
                    SKAction.removeFromParent()
                    ]))
                
                self.runAction(playCorrectSoundEffect)
                
                spawnNewMoney()
    
                scoreNumber = scoreNumber + 20
                scoreLabel.text = "$\(scoreNumber)"
                
                if scoreNumber >= 1000 && zip == 0
                {
                    spawnNewMoney()
                    zip += 1
                    break
                }
                
                if scoreNumber >= 3000 && zip == 1
                {
                    spawnNewMoney()
                    zip += 1
                    break
                }
                
                if scoreNumber >= 6000 && zip == 2
                {
                    spawnNewMoney()
                    zip += 1
                    break
                }
                
                if scoreNumber >= 10000 && zip == 3
                {
                    spawnNewMoney()
                    zip += 1
                    break
                }
                
                if scoreNumber >= 15000 && zip == 4
                {
                    spawnNewMoney()
                    zip += 1
                    break
                }
                
            }
            
            else if nameOfTappedNode == "moneyObject2"
            {
                tappedNode.name = ""
                
                tappedNode.removeAllActions()
                
                tappedNode.runAction(SKAction.sequence([
                    SKAction.fadeOutWithDuration(0.1),
                    SKAction.removeFromParent()
                    ]))
                
                self.runAction(playCorrectSoundEffect)
                
                spawnNewMoney()
                
                
                scoreNumber = scoreNumber + 50
                scoreLabel.text = "$\(scoreNumber)"
                
            }
            
            else if nameOfTappedNode == "moneyObject3"
            {
                tappedNode.name = ""
                
                tappedNode.removeAllActions()
                
                tappedNode.runAction(SKAction.sequence([
                    SKAction.fadeOutWithDuration(0.1),
                    SKAction.removeFromParent()
                    ]))
                
                self.runAction(playCorrectSoundEffect)

                spawnNewMoney()
                
                
                scoreNumber = scoreNumber + 100
                scoreLabel.text = "$\(scoreNumber)"
                
            }
            
            else if nameOfTappedNode == "moneyObject4"
            {
                tappedNode.name = ""
                
                tappedNode.removeAllActions()
                
                tappedNode.runAction(SKAction.sequence([
                    SKAction.fadeOutWithDuration(0.1),
                    SKAction.removeFromParent()
                    ]))
                
                self.runAction(playCorrectSoundEffect)

                spawnNewMoney()
                
                
                scoreNumber = scoreNumber + 125
                scoreLabel.text = "$\(scoreNumber)"
                
            }
            
        }
    }
    
    func spawnNewMoney()
    {
        var randomImageNumber = arc4random()%4
        randomImageNumber = randomImageNumber + 1
        
        var money = SKSpriteNode()
        
        if randomImageNumber == 1
        {
            money = SKSpriteNode(imageNamed: "Money\(randomImageNumber)")
            money.zPosition = 2
            money.name = "moneyObject1"
        }
        else if randomImageNumber == 2
        {
            money = SKSpriteNode(imageNamed: "Money\(randomImageNumber)")
            money.zPosition = 2
            money.name = "moneyObject2"
        }
        else if randomImageNumber == 3
        {
            money = SKSpriteNode(imageNamed: "Money\(randomImageNumber)")
            money.zPosition = 2
            money.name = "moneyObject3"
        }
        else if randomImageNumber == 4
        {
            money = SKSpriteNode(imageNamed: "Money\(randomImageNumber)")
            money.zPosition = 2
            money.name = "moneyObject4"
        }

        
        let randomX = random(min: CGRectGetMinX(gameArea) + money.size.width/2,
                             max: CGRectGetMaxX(gameArea) - money.size.width/2)
        
        let randomY = random(min: CGRectGetMinY(gameArea) + money.size.height/2,
                             max: CGRectGetMaxY(gameArea) - money.size.height/2)
        
        money.position = CGPoint(x: randomX, y: randomY)
        
        self.addChild(money)
        
        money.runAction(SKAction.sequence([
            SKAction.scaleTo(0, duration: 3),
            playGameOverSoundEffect,
            SKAction.runBlock(runGameOver)
            ]))
        
    }
    
    func runGameOver()
    {
        let SceneToMoveTo = GameOverScene(size: self.size)
        SceneToMoveTo.scaleMode = self.scaleMode
        
        let sceneTransition = SKTransition.fadeWithDuration(0.2)
        self.view!.presentScene(SceneToMoveTo, transition: sceneTransition)
        
    }

}
