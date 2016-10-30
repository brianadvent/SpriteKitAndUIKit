//
//  ViewController.swift
//  SpriteKitUIKit
//
//  Created by Training on 30/10/2016.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: SKView!
    
    var scene:BeeScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.scene = BeeScene(size: CGSize(width: self.sceneView.frame.size.width, height: self.sceneView.frame.size.height))
        self.sceneView.presentScene(scene)
        
    }
    
    @IBAction func orderBreakfastAndShowBee(_ sender: Any) {
        if let scene = self.scene {
            scene.flyBee()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

