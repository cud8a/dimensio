//
//  AnotherViewController.swift
//  Dimensio
//
//  Created by Tamas Bara on 05.06.17.
//  Copyright © 2017 Tamas Bara. All rights reserved.
//

import UIKit

protocol AnotherViewControllerDelegate: class {
    func anotherViewControllerDoSomthing(_ controller: AnotherViewController)
}

class AnotherViewController: UIViewController {

    weak var delegate: AnotherViewControllerDelegate?
    
    func doSomething() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            if let vc = self {
                vc.delegate?.anotherViewControllerDoSomthing(vc)
            }
        }
    }
    
    deinit {
        print("---------- \(self) ------- deinit")
    }
}
