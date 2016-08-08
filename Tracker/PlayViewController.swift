//
//  PlayViewController.swift
//  Tracker
//
//  Created by Courtney Osborne on 8/8/16.
//  Copyright © 2016 Stefan. All rights reserved.
//

import UIKit
import SpriteKit

class PlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        gameScrollView()
    }
    
    func gameScrollView() {
        
        // This should set up the scene
        let scene = PlayScene(size: view.bounds.size)
    
        let skView = view as! SKView
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
