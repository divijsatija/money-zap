//
//  GameOverScene.swift
//  Money Zap
//
//  Created by Divij Satija on 19/04/16.
//  Copyright © 2016 Divij Satija. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit
import GoogleMobileAds

class GameOverScene: SKScene, GKGameCenterControllerDelegate, GADInterstitialDelegate, KiipDelegate
{
    let restartSound = SKAction.playSoundFileNamed("RestartSound.mp3", waitForCompletion: false)
    let tapSound = SKAction.playSoundFileNamed("TapSound.mp3", waitForCompletion: false)
    var myShare = "I Zapped $\(scoreNumber) in Money Zap! Can you beat me?  #MoneyZap"
    var shareLink = NSURL(string: "https://itunes.apple.com/app/id1111933952")
    
    var interstitialAd: GADInterstitial?
    
    override func didMoveToView(view: SKView)
    {
        let background = SKSpriteNode(imageNamed: "MoneyBackground.jpg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let scoreBox = SKSpriteNode(imageNamed: "ScoreBox.png")
        scoreBox.size = CGSize(width: 1000, height: 900)
        scoreBox.zPosition = 1
        scoreBox.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(scoreBox)
        
        let gameOverLabel = SKLabelNode(fontNamed: "SurfingAshtrayDEMO")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 140
        gameOverLabel.fontColor = UIColor(red: 0.35, green: 0.95, blue: 1, alpha: 1)
        gameOverLabel.zPosition = 2
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        self.addChild(gameOverLabel)
        
        let finalScoreLabel = SKLabelNode(fontNamed: "Shoemaker")
        finalScoreLabel.text = "Payday: $\(scoreNumber)"
        finalScoreLabel.fontSize = 120
        finalScoreLabel.fontColor = SKColor.whiteColor()
        finalScoreLabel.zPosition = 2
        finalScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        self.addChild(finalScoreLabel)
        
        let defaults = NSUserDefaults()
        var highScoreNumber = defaults.integerForKey("highScoreSaved")
        
        saveHighScore(highScoreNumber)
        
        var netWorth = defaults.integerForKey("netWorthSaved")
        netWorth = netWorth + scoreNumber
        defaults.setInteger(netWorth, forKey: "netWorthSaved")
        
        saveNetWorth(netWorth)
        
        if scoreNumber > highScoreNumber
        {
            highScoreNumber = scoreNumber
            defaults.setInteger(highScoreNumber, forKey: "highScoreSaved")
            
            saveHighScore(highScoreNumber)
            
            Kiip.sharedInstance().saveMoment("making a new high score!", withCompletionHandler: {(poptart:KPPoptart!, error:NSError!) -> Void in
                if (error != nil) {
                    /* handle error */
                }
                
                if (poptart == nil) {
                    /* handle case with no reward to give*/
                    print("Successful moment call but no reward to give.")
                }
                
                if (poptart != nil) {
                    poptart.show()
                }
            })
        }
        
        let highScoreLabel = SKLabelNode(fontNamed: "Shoemaker")
        highScoreLabel.text = "Biggest Payday: $\(highScoreNumber)"
        highScoreLabel.fontSize = 120
        highScoreLabel.fontColor = SKColor.whiteColor()
        highScoreLabel.zPosition = 2
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(highScoreLabel)
        
        let restartButton = SKSpriteNode(imageNamed: "Restart Button")
        restartButton.size = CGSize(width: 225, height: 225)
        restartButton.zPosition = 2
        restartButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.38)
        restartButton.name = "restartButton"
        self.addChild(restartButton)
        
        let homeButton = SKSpriteNode(imageNamed: "Home Button")
        homeButton.size = CGSize(width: 225, height: 225)
        homeButton.zPosition = 2
        homeButton.position = CGPoint(x: self.size.width/3.5, y: self.size.height*0.38)
        homeButton.name = "exitButton"
        self.addChild(homeButton)
        
        let shareButton = SKSpriteNode(imageNamed: "Share Button")
        shareButton.size = CGSize(width: 225, height: 225)
        shareButton.zPosition = 2
        shareButton.position = CGPoint(x: self.size.width/1.4, y: self.size.height*0.38)
        shareButton.name = "shareButton"
        self.addChild(shareButton)
        
        interstitialAd = createAndLoadInterstitial()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        for touch: AnyObject in touches
        {
            let pointOfTouch = touch.locationInNode(self)
            let tappedNode = nodeAtPoint(pointOfTouch)
            let tappedNodeName = tappedNode.name
            
            
            if tappedNodeName == "restartButton"
            {
                randomPresentationOfAdWithFrequency()
                
                self.runAction(restartSound)
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fadeWithDuration(0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "exitButton"
            {
                randomPresentationOfAdWithFrequency()
                
                self.runAction(tapSound)
                
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fadeWithDuration(0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "shareButton"
            {
                self.runAction(tapSound)
                
                shareMenu()
            }
            
        }
        
    }
    
    func shareMenu()
    {
        let viewController = self.view!.window?.rootViewController
        
        let activityVC:UIActivityViewController = UIActivityViewController(activityItems: [myShare, shareLink!], applicationActivities: nil)
        
        viewController?.presentViewController(activityVC, animated: true, completion: nil)
        
    }
    
    func saveHighScore(number: Int)
    {
        if GKLocalPlayer.localPlayer().authenticated
        {
            let scoreReporter = GKScore(leaderboardIdentifier: "HighScore")
            
            scoreReporter.value = Int64(number)
            
            let scoreArray : [GKScore] = [scoreReporter]
            
            GKScore.reportScores(scoreArray, withCompletionHandler: nil)
            
        }
        
    }
    
    func saveNetWorth(number: Int)
    {
        if GKLocalPlayer.localPlayer().authenticated
        {
            let scoreReporter = GKScore(leaderboardIdentifier: "NetWorth")
            
            scoreReporter.value = Int64(number)
            
            let scoreArray2 : [GKScore] = [scoreReporter]
            
            GKScore.reportScores(scoreArray2, withCompletionHandler: nil)
            
        }
        
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController)
    {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func createAndLoadInterstitial() -> GADInterstitial
    {
        let request = GADRequest()
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-5265767669565593/6279849861")
        interstitial.delegate = self
        interstitial.loadRequest(request)
        
        return interstitial
        
    }
    
    func showAd()
    {

        if interstitialAd != nil
        {
            if self.interstitialAd!.isReady
            {
                self.interstitialAd?.presentFromRootViewController((self.view?.window?.rootViewController)!)
            }
        }
        
    }
    
    func interstitialDidDismissScreen(ad: GADInterstitial!)
    {
        interstitialAd = createAndLoadInterstitial()
        
    }
    
    func randomPresentationOfAdWithFrequency()
    {
        var randomNumber = arc4random()%2
        randomNumber = randomNumber + 1
        
        if randomNumber == 2
        {
            showAd()
        }
        
    }
    
}