//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by zx on 3/5/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController : HappinessViewController, UIPopoverPresentationControllerDelegate {
    
    var diagnosticHistory: [Int] {
        get {
            return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: History.DefaultsKey)
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "aVeryLongNameKey"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}
