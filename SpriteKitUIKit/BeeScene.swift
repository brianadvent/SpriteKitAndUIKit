//
//  BeeScene.swift
//  SpriteKitUIKit
//
//  Created by Training on 30/10/2016.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class BeeScene: SKScene {

    var beeFrames:[SKTexture]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = UIColor.white
        var frames:[SKTexture] = []
        
        let beeAtlas = SKTextureAtlas(named: "Bee")
        
        for index in 1 ... 6 {
            let textureName = "bee_\(index)"
            let texture = beeAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        self.beeFrames = frames

    }
    
    
    func flyBee() {
        let texture = self.beeFrames![0]
        let bee = SKSpriteNode(texture: texture)
        
        bee.size = CGSize(width: 140, height: 140)
        
        let randomBeeYPositionGenerator = GKRandomDistribution(lowestValue: 50, highestValue: Int(self.frame.size.height))
        let yPosition = CGFloat(randomBeeYPositionGenerator.nextInt())
        
        let rightToLeft = arc4random() % 2 == 0
        
        let xPosition = rightToLeft ? self.frame.size.width + bee.size.width / 2 : -bee.size.width / 2
        
        bee.position = CGPoint(x: xPosition, y: yPosition)
        
        if rightToLeft {
            bee.xScale = -1
        }
        
        self.addChild(bee)
        
        bee.run(SKAction.repeatForever(SKAction.animate(with: self.beeFrames!, timePerFrame: 0.05, resize: false, restore: true)))
        
        var distanceToCover = self.frame.size.width + bee.size.width
        
        if rightToLeft {
            distanceToCover *= -1
        }
        
        let time = TimeInterval(abs(distanceToCover / 140))
        
        let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: time)
        
        let removeAction = SKAction.run {
            bee.removeAllActions()
            bee.removeFromParent()
        }
        
        let allActions = SKAction.sequence([moveAction, removeAction])
        
        bee.run(allActions)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
