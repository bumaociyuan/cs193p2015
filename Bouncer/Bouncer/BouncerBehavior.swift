//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by zx on 3/27/15.
//  Copyright (c) 2015 zztx. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let result = UICollisionBehavior()
        result.translatesReferenceBoundsIntoBoundary = true
        return result
        }()
    
    lazy var blockBehavior: UIDynamicItemBehavior = {
        let result = UIDynamicItemBehavior()
        result.allowsRotation = true
        result.elasticity = 0.85
        result.friction = 0
        result.resistance = 0
        return result
        }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(blockBehavior)
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addBlock(block: UIView) {
        dynamicAnimator?.referenceView?.addSubview(block)
        gravity.addItem(block)
        collider.addItem(block)
        blockBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView) {
        gravity.removeItem(block)
        collider.removeItem(block)
        blockBehavior.removeItem(block)
        block.removeFromSuperview()
    }
}
