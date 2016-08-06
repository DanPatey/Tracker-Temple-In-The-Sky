//
//  IntroViewController.swift
//  DieForcePrototype
//
//  Created by Dan Patey on 8/6/16.
//  Copyright © 2016 Stefan. All rights reserved.
//

import AVFoundation
import MediaPlayer
import Foundation
import AVKit

class IntroViewController: UIViewController {

var player: AVPlayer?

override func viewDidLoad() {
    super.viewDidLoad()
    
    loadVideo()
    
    }

    private func loadVideo() {
    
        //this line is important to prevent background music stop
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
        } catch { }
    
        let path = NSBundle.mainBundle().pathForResource("intro", ofType:"mp4")
    
        player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        let playerLayer = AVPlayerLayer(player: player)
    
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravityResize
        playerLayer.zPosition = -1
    
        self.view.layer.addSublayer(playerLayer)
    
        player?.seekToTime(kCMTimeZero)
        player?.play()
        
        // Timer that transitions from the video to the game
        NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: #selector(endPresentationVideoTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func whenPlayerTaps(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("AfterTapped", sender: self)
    }
    
    func endPresentationVideoTimer(){
        
        performSegueWithIdentifier("PresentTitleGameView", sender: self)
    }
}