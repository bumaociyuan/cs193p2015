//
//  ViewController.swift
//  Psychologist
//
//  Created by zx on 3/5/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UINavigationController
        if let hvc = destination?.visibleViewController as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad": hvc.happiness = 0
                case "happy": hvc.happiness = 100
                case "nothing": hvc.happiness = 25
                default: hvc.happiness = 50
                }
                
            }
        }
    }
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
}

