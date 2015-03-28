//
//  AppDelegate.swift
//  Bouncer
//
//  Created by zx on 3/27/15.
//  Copyright (c) 2015 zztx. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate : UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    struct Motion {
        static let Manager = CMMotionManager()
    }
}
