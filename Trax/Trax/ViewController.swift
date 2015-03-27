//
//  ViewController.swift
//  Trax
//
//  Created by zx on 3/27/15.
//  Copyright (c) 2015 zztx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        let appDelegate = UIApplication.sharedApplication().delegate!
        center.addObserverForName(GPXURL.Notification, object: appDelegate, queue: queue) { notification in
            if let url: AnyObject = notification.userInfo?[GPXURL.Key] {
                self.textView.text = url as? String
            }
        }
    }

}

