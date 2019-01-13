//
//  ViewController.swift
//  StackableContainers
//
//  Created by sreekanth reddy iragam reddy on 1/12/19.
//  Copyright © 2019 com.new.swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        DispatchQueue.main.async {
            guard let view = segue.destination.view, let container = view.superview, let stackView = container.superview as? UIStackView else {
                return
            }
            
            stackView.removeArrangedSubview(container)
            container.removeFromSuperview()
            view.removeFromSuperview()
            stackView.addArrangedSubview(view)
            view.layoutSuperViews()
        }
    }
}

extension UIView {
    func layoutSuperViews() {
        var view: UIView? = self
        while view != nil {
            view?.layoutIfNeeded()
            view = view?.superview ?? nil
        }
        
        while view != nil {
            view?.setNeedsLayout()
            view = view?.superview ?? nil
        }
    }
}

