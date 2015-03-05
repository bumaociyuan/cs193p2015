//
//  TextViewController.swift
//  Psychologist
//
//  Created by zx on 3/5/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                let size = presentingViewController!.view.bounds.size
                return textView.sizeThatFits(size)
            } else {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue }
    }
}
