//
//  MainMenuScene.swift
//  Money Zap
//
//  Created by Divij Satija on 19/04/16.
//  Copyright © 2016 Divij Satija. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit

class MainMenuScene: SKScene, GKGameCenterControllerDelegate
{
    let tapSound = SKAction.playSoundFileNamed("TapSound.mp3", waitForCompletion: false)
    var myShare = "Just played this Epic new game! Try it out! #MoneyZap"
    let shareLink = NSURL(string: "https://itunes.apple.com/app/id1111933952")
    let Ilink = NSURL(string: "https://instagram.com/divijsatija")
    let Tlink = NSURL(string: "https://twitter.com/divijsatija")
    let Ylink = NSURL(string: "https://youtube.com/divijsatija")
    let Rlink = NSURL(string: "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1111933952")
    
   // var gameCenterAchievements = [String: GKAchievement]()
    
    override func didMoveToView(view: SKView)
    {
        let background = SKSpriteNode(imageNamed: "MoneyBackground.jpg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let gameTitleLabel1 = SKLabelNode(fontNamed: "MoneyShot")
        gameTitleLabel1.text = "Money"
        gameTitleLabel1.fontSize = 475
        gameTitleLabel1.fontColor = UIColor(red: 0.2, green: 0.95, blue: 0.7, alpha: 1)
        gameTitleLabel1.zPosition = 1
        gameTitleLabel1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.80)
        self.addChild(gameTitleLabel1)
        
        let gameTitleLabel2 = SKLabelNode(fontNamed: "MoneyShot")
        gameTitleLabel2.text = "Zap"
        gameTitleLabel2.fontSize = 475
        gameTitleLabel2.fontColor = UIColor(red: 0.2, green: 0.95, blue: 0.7, alpha: 1)
        gameTitleLabel2.zPosition = 1
        gameTitleLabel2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.63)
        self.addChild(gameTitleLabel2)
        
        let playButton = SKSpriteNode(imageNamed: "Play Button")
        playButton.size = CGSize(width: 300, height: 300)
        playButton.zPosition = 1
        playButton.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
        playButton.name = "playButton"
        self.addChild(playButton)
        
        let infoButton = SKSpriteNode(imageNamed: "Info Button")
        infoButton.size = CGSize(width: 225, height: 225)
        infoButton.zPosition = 1
        infoButton.position = CGPoint(x: self.size.width/4, y: self.size.height/5.65)
        infoButton.name = "infoButton"
        self.addChild(infoButton)
        
        let rateButton = SKSpriteNode(imageNamed: "Rate Button")
        rateButton.size = CGSize(width: 225, height: 225)
        rateButton.zPosition = 1
        rateButton.position = CGPoint(x: self.size.width/1.35, y: self.size.height/2)
        rateButton.name = "rateButton"
        self.addChild(rateButton)
        
        let leaderboardsButton = SKSpriteNode(imageNamed: "Leaderboards Button")
        leaderboardsButton.size = CGSize(width: 225, height: 225)
        leaderboardsButton.zPosition = 1
        leaderboardsButton.position = CGPoint(x: self.size.width/1.35, y: self.size.height/5.65)
        leaderboardsButton.name = "leaderboardsButton"
        self.addChild(leaderboardsButton)
        
     /*   let achievementsButton = SKSpriteNode(imageNamed: "Achievements Button")
        achievementsButton.size = CGSize(width: 200, height: 200)
        achievementsButton.zPosition = 1
        achievementsButton.position = CGPoint(x: self.size.width/1.285, y: self.size.height/3)
        achievementsButton.name = "achievementsButton"
        self.addChild(achievementsButton)    */
        
        let QmarkButton = SKSpriteNode(imageNamed: "Qmark Button")
        QmarkButton.size = CGSize(width: 225, height: 225)
        QmarkButton.zPosition = 1
        QmarkButton.position = CGPoint(x: self.size.width/4, y: self.size.height/2)
        QmarkButton.name = "QmarkButton"
        self.addChild(QmarkButton)
        
     /*   let shareButton = SKSpriteNode(imageNamed: "Share Button")
        shareButton.size = CGSize(width: 200, height: 200)
        shareButton.zPosition = 1
        shareButton.position = CGPoint(x: self.size.width/1.5, y: self.size.height/2)
        shareButton.name = "shareButton"
        self.addChild(shareButton)  */
        
        let Clabel1 = SKLabelNode(fontNamed: "MyEpicSelfieDemo")
        Clabel1.text = "(c) Divij Satija"
        Clabel1.fontSize = 50
        Clabel1.fontColor = UIColor.whiteColor()
        Clabel1.zPosition = 1
        Clabel1.position = CGPoint(x: self.size.width/2, y: self.size.height/18)
        self.addChild(Clabel1)
        
        let Clabel2 = SKLabelNode(fontNamed: "MyEpicSelfieDemo")
        Clabel2.text = "(c) Tropical Apps Inc."
        Clabel2.fontSize = 50
        Clabel2.fontColor = UIColor.whiteColor()
        Clabel2.zPosition = 1
        Clabel2.position = CGPoint(x: self.size.width/2, y: self.size.height/45)
        self.addChild(Clabel2)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        
        for touch: AnyObject in touches
        {
            let pointOnTouch = touch.locationInNode(self)
            let tappedNode = nodeAtPoint(pointOnTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "playButton"
            {
                self.runAction(tapSound)
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fadeWithDuration(0.1)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
                
            }
            
            if tappedNodeName == "leaderboardsButton"
            {
                self.runAction(tapSound)
                
                showLeaderboard()
            }
            
        /*    if tappedNodeName == "shareButton"
            {
                self.runAction(tapSound)
                
                shareMenu()
            }   */
            
            if tappedNodeName == "QmarkButton"
            {
                self.runAction(tapSound)
                
                removeAllChildren()
                
                let background = SKSpriteNode(imageNamed: "background.jpg")
                background.size = self.size
                background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
                background.zPosition = 0
                background.name = "background"
                self.addChild(background)
                
                let QmarkBox = SKSpriteNode(imageNamed: "HowTo")
                QmarkBox.size = CGSize(width: 900, height: 900)
                QmarkBox.zPosition = 1
                QmarkBox.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
                QmarkBox.name = "QmarkBox"
                self.addChild(QmarkBox)
                
                let menuLabel = SKLabelNode(fontNamed: "MyEpicSelfieDemo")
                menuLabel.text = "Tap anywhere in the background to go back to the main menu."
                menuLabel.fontSize = 35
                menuLabel.fontColor = UIColor.whiteColor()
                menuLabel.zPosition = 1
                menuLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/4)
                self.addChild(menuLabel)
                
                let Clabel1 = SKLabelNode(fontNamed: "MyEpicSelfieDemo")
                Clabel1.text = "(c) Divij Satija"
                Clabel1.fontSize = 50
                Clabel1.fontColor = UIColor.whiteColor()
                Clabel1.zPosition = 1
                Clabel1.position = CGPoint(x: self.size.width/2, y: self.size.height/18)
                self.addChild(Clabel1)
                
                let Clabel2 = SKLabelNode(fontNamed: "MyEpicSelfieDemo")
                Clabel2.text = "(c) Tropical Apps Inc."
                Clabel2.fontSize = 50
                Clabel2.fontColor = UIColor.whiteColor()
                Clabel2.zPosition = 1
                Clabel2.position = CGPoint(x: self.size.width/2, y: self.size.height/45)
                self.addChild(Clabel2)
            }
            
            if tappedNodeName == "background"
            {
                self.runAction(tapSound)
                
                tappedNode.runAction(SKAction.sequence([
                    SKAction.fadeOutWithDuration(0.1),
                    SKAction.removeFromParent()
                    ]))
                
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fadeWithDuration(0.1)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "infoButton"
            {
                self.runAction(tapSound)
                
                removeAllChildren()
                
                let background = SKSpriteNode(imageNamed: "background.jpg")
                background.size = self.size
                background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
                background.zPosition = 0
                background.name = "background"
                self.addChild(background)
                
                let infoBox = SKSpriteNode(imageNamed: "InfoBox")
                infoBox.size = CGSize(width: 900, height: 900)
                infoBox.zPosition = 1
                infoBox.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
                infoBox.name = "infoBox"
                self.addChild(infoBox)
                
                let menuLabel = SKLabelNode(fontNamed: "MyEpicSelfieDemo")
                menuLabel.text = "Tap anywhere in the background to go back to the main menu."
                menuLabel.fontSize = 35
                menuLabel.fontColor = UIColor.whiteColor()
                menuLabel.zPosition = 1
                menuLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/4)
                self.addChild(menuLabel)
                
                let Ybutton = SKSpriteNode(imageNamed: "youtube")
                Ybutton.size = CGSize(width: 150, height: 150)
                Ybutton.zPosition = 2
                Ybutton.position = CGPoint(x: self.size.width/2, y: self.size.height/2.85)
                Ybutton.name = "Ybutton"
                self.addChild(Ybutton)
                
                let Ibutton = SKSpriteNode(imageNamed: "instagram")
                Ibutton.size = CGSize(width: 150, height: 150)
                Ibutton.zPosition = 2
                Ibutton.position = CGPoint(x: self.size.width/1.5, y: self.size.height/2.85)
                Ibutton.name = "Ibutton"
                self.addChild(Ibutton)
                
                let Tbutton = SKSpriteNode(imageNamed: "twitter")
                Tbutton.size = CGSize(width: 150, height: 150)
                Tbutton.zPosition = 2
                Tbutton.position = CGPoint(x: self.size.width/3, y: self.size.height/2.85)
                Tbutton.name = "Tbutton"
                self.addChild(Tbutton)
                
                let Clabel1 = SKLabelNode(fontNamed: "MyEpicSelfieDemo")
                Clabel1.text = "(c) Divij Satija"
                Clabel1.fontSize = 50
                Clabel1.fontColor = UIColor.whiteColor()
                Clabel1.zPosition = 1
                Clabel1.position = CGPoint(x: self.size.width/2, y: self.size.height/18)
                self.addChild(Clabel1)
                
                let Clabel2 = SKLabelNode(fontNamed: "MyEpicSelfieDemo")
                Clabel2.text = "(c) Tropical Apps Inc."
                Clabel2.fontSize = 50
                Clabel2.fontColor = UIColor.whiteColor()
                Clabel2.zPosition = 1
                Clabel2.position = CGPoint(x: self.size.width/2, y: self.size.height/45)
                self.addChild(Clabel2)
            }
            
            if tappedNodeName == "Ybutton"
            {
                UIApplication.sharedApplication().openURL(Ylink!)
            }
            
            if tappedNodeName == "Ibutton"
            {
                UIApplication.sharedApplication().openURL(Ilink!)
            }
            
            if tappedNodeName == "Tbutton"
            {
                UIApplication.sharedApplication().openURL(Tlink!)
            }
            
            if tappedNodeName == "rateButton"
            {
                UIApplication.sharedApplication().openURL(Rlink!)
            }
            
        }
        
    }
    
    func shareMenu()
    {
        let viewController = self.view!.window?.rootViewController
        
        let activityVC:UIActivityViewController = UIActivityViewController(activityItems: [myShare, shareLink!], applicationActivities: nil)
        
        viewController?.presentViewController(activityVC, animated: true, completion: nil)
        
    }
    
    func showLeaderboard()
    {
        let viewController = self.view!.window?.rootViewController
        let gcvc = GKGameCenterViewController()
        
        gcvc.gameCenterDelegate = self
        
        viewController?.presentViewController(gcvc, animated: true, completion: nil)
        
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController)
    {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
  /*  func loadAchievementPercentages()
    {
        print("Getting percentages of past achievements...")
        
        GKAchievement.loadAchievementsWithCompletionHandler({ (allAchievements, error) -> Void in
            
            if error != nil
            {
                print("Game Center could not load achievements, the error is \(error)")
            }
            
            else
            {
                if (allAchievements != nil)
                //in case of no achievements so far
                {
                   for theAchievement in allAchievements!
                   {
                       if let singleAchievement: GKAchievement = theAchievement
                       {
                           self.gameCenterAchievements[singleAchievement.identifier!] = singleAchievement
                       }
                    
                   }
                    
                }
            }
            
        
              })
    
    }
    
    func incrementCurrentPercentageOfAchievement(identifier: String, amount: Double)
    {
        if GKLocalPlayer.localPlayer().authenticated
        {
            var currentPercentFound:Bool = false
            
            if (gameCenterAchievements.count != 0)
            {
                for (id, achievement) in gameCenterAchievements
                {
                    if (id == identifier)
                    {
                        currentPercentFound = true
                        
                        var currentPercent:Double = achievement.percentComplete
                        currentPercent = currentPercent + amount
                        
                        reportAchievement(identifier, percentComplete:currentPercent)
                        
                        break
                    }
                }
            }
            
            if (currentPercentFound == false)
            {
                reportAchievement(identifier, percentComplete:amount)
            }
        }
        
    }
    
    func reportAchievement(identifier: String, percentComplete: Double)
    {
        let achievement = GKAchievement(identifier: identifier)
        achievement.percentComplete = percentComplete
        
        let achievementArray: [GKAchievement] = [achievement]
        
        GKAchievement.reportAchievements(achievementArray, withCompletionHandler: {
            
            error -> Void in
            
            if (error != nil)
            {
                print(error)
            }
            
            else
            {
                self.gameCenterAchievements.removeAll()
                self.loadAchievementPercentages()
            }
            
        })
        
    }   */

}


