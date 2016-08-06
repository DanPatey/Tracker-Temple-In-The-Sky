//
//  TitleViewController.swift
//  DieForcePrototype
//
//  Created by Dan Patey on 8/6/16.
//  Copyright © 2016 Stefan. All rights reserved.
//


import AVFoundation
import MediaPlayer
import Foundation
import AVKit

class TitleViewController: UIViewController {
    var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadVideo()
    }
    
    @objc private func loadVideo() {
        
        //this line is important to prevent background music stop
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
        } catch { }
        
        let path = NSBundle.mainBundle().pathForResource("title", ofType:"mp4")
        
        player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravityResize
        playerLayer.zPosition = -1
        
        self.view.layer.addSublayer(playerLayer)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
             selector: #selector(loadVideo),
             name: AVPlayerItemDidPlayToEndTimeNotification,
             object: self.player.currentItem)
        
        player?.seekToTime(kCMTimeZero)
        player?.play()
    }
    
    func endOfPresentationVideoTimer(){
        
        performSegueWithIdentifier("AfterVideoLoopSegue", sender: self)
    }
}