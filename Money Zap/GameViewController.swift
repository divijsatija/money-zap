//
//  GameViewController.swift
//  Money Zap
//
//  Created by Divij Satija on 19/04/16.
//  Copyright (c) 2016 Divij Satija. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit
import GoogleMobileAds

class GameViewController: UIViewController, GKGameCenterControllerDelegate, GADBannerViewDelegate {
    
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authPlayer()

        let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        
        // Create a banner ad and add it to the view hierarchy.
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        bannerView.hidden = true
        bannerView.adUnitID = "ca-app-pub-5265767669565593/1710049462"
        bannerView.rootViewController = self
        view.addSubview(bannerView)

        bannerView.hidden = false
        let request = GADRequest()
        bannerView.loadRequest(request)
       
        relayoutViews()
        
    }
    
    func relayoutViews()
    {
        let screenRect = UIScreen.mainScreen().bounds
        
            var bannerFrame = bannerView!.frame
            bannerFrame.origin.x = 0
            bannerFrame.origin.y = screenRect.size.height - bannerFrame.size.height
            bannerView!.frame = bannerFrame
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func authPlayer()
    {
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler =
        {
            (view, error) in
            
            if view != nil
            {
                self.presentViewController(view!, animated: true, completion: nil)
            }
            else
            {
                print(GKLocalPlayer.localPlayer().authenticated)
            }
            
        }
        
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController)
    {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)

    }
    
}
