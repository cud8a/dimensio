//
//  ViewController.swift
//  Dimensio
//
//  Created by Tamas Bara on 05.06.17.
//  Copyright © 2017 Tamas Bara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var texts = ["When I got there I could remember most of it, but as it's quite a long boulder I had to improvise on some of the foot placements. When I climbed it I did everything exactly how I had planned and it worked out somehow!",
                 "With free-soloing, obviously I know that I’m in danger, but feeling fearful while I’m up there is not helping me in any way.",
                 "So what kind of strength training have you done?"]
    
    var replaceWith = "First, instantiate an offscreen instance of a table view cell, one instance for each reuse identifier, that is used strictly for height calculations. (Offscreen meaning the cell reference is stored in a property/ivar on the view controller and never returned from tableView:cellForRowAtIndexPath: for the table view to actually render onscreen.) Next, the cell must be configured with the exact content (e.g. text, images, etc) that it would hold if it were to be displayed in the table view."
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "gonzo")
        tableView.estimatedRowHeight = 100.0
        
        let avc = AnotherViewController()
        avc.delegate = self
        avc.doSomething()
        addChildViewController(avc)
    }
    
    @IBAction func ctaClick(_ sender: Any) {
        replaceRow()
    }
    
    fileprivate func replaceRow() {
        let copy = texts[2]
        texts[2] = replaceWith
        replaceWith = copy
        tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .middle)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "gonzo"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TableViewCell else {return UITableViewCell()}
        
        cell.label.text = texts[safeIndex: indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension ViewController: AnotherViewControllerDelegate {
    func anotherViewControllerDoSomthing(_ controller: AnotherViewController) {
        replaceRow()
    }
}
