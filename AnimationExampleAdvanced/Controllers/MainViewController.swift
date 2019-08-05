/*
 * Copyright (c) Francisco Obarrio - fobarrio@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit


class MainViewController: UIViewController,  UINavigationControllerDelegate, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var backgroundView: UIView!
    
    
    let transition = TransitionCoordinator()
    
    var selectedIndexPath: IndexPath!
    
    // This is an array of dictionaries.
    var dictionaryDataArray: [[String: String]] =  [
        [
            "profileImage": "profile1",
            "backgroundImage": "kateperry",
            "album": "One of the Boys",
            "year": "2003",
            "hexBackgroundColor": "d15d63",
            "title": "Kate Perry"
        ],
        [
            "profileImage": "profile2",
            "backgroundImage": "bruce1",
            "album": "Born in the USA",
            "year": "1984",
            "hexBackgroundColor": "2d72b5",
            "title": "Bruce Springsteen"
        ],
        [
            "profileImage": "profile3",
            "backgroundImage": "mjackson",
            "album": "Thriller",
            "year": "1982",
            "hexBackgroundColor": "fdeba9",
            "title": "Michael Jackson"
        ],
        
        [
            "profileImage": "profile4",
            "backgroundImage": "madonna",
            "album": "Like a Prayer",
            "year": "1998",
            "hexBackgroundColor": "S1B733",
            "title": "Madonna"
        ]
        
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "mainCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let transitionCoordinator = navigationController?.transitionCoordinator,
            let fromVC = transitionCoordinator.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionCoordinator.viewController(forKey: UITransitionContextViewControllerKey.to),
            fromVC is PushedViewController,
            toVC is MainViewController {
            
            doAnimFadeIn()
            
        }
    }
    
    func doAnimFadeIn() {
        
        let cells = self.tableView.indexPathsForVisibleRows
        var index = 0
        
        if let cells = cells, cells.count > 0 {
            for x in 0..<cells.count
            {
                let cell = tableView.cellForRow(at: cells[x])
                if selectedIndexPath != cells[x] {
                    UIView.animate(withDuration: 0.3, delay: 0.15 * Double(x), options: [], animations: {
                        cell?.alpha = 1
                        cell?.transform = CGAffineTransform.identity
                    }, completion: nil)
                }
                index+=1
            }
        }
    }
    
    func doAnimFadeOut() {
        
        let cells = self.tableView.indexPathsForVisibleRows
        var index = 0
        
        if let cells = cells, cells.count > 0 {
            for x in 0..<cells.count
            {
                let cell = tableView.cellForRow(at: cells[x])
                if selectedIndexPath != cells[x] {
                    UIView.animate(withDuration: 0.2, delay: 0.15 * Double(x), options: [], animations: {
                        cell?.alpha = 0
                        cell?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                    }, completion: nil)
                }
                index+=1
            }
        }
        
    }
    

    
}


