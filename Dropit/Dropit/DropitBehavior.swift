//
//  DropitBehavior.swift
//  Dropit
//
//  Created by zx on 3/14/15.
//  Copyright (c) 2015 zztx. All rights reserved.
//

import UIKit

class DropitBehavior: UIDynamicBehavior
{
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let result = UICollisionBehavior()
        result.translatesReferenceBoundsIntoBoundary = true
        return result
    }()
    
    lazy var dropBehavior: UIDynamicItemBehavior = {
        let result = UIDynamicItemBehavior()
        result.allowsRotation = true
        result.elasticity = 0.7
        return result
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(dropBehavior)
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addDrop(drop: UIView) {
        dynamicAnimator?.referenceView?.addSubview(drop)
        gravity.addItem(drop)
        collider.addItem(drop)
        dropBehavior.addItem(drop)
    }
    
    func removeDrop(drop: UIView) {
        gravity.removeItem(drop)
        collider.removeItem(drop)
        dropBehavior.removeItem(drop)
        drop.removeFromSuperview()
    }
}
