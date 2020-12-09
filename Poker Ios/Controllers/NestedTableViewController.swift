//
//  NestedTableViewController.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/03.
//

import UIKit

class NestedTableViewController: UIViewController{
    
    @IBOutlet weak var tbl_height: NSLayoutConstraint!
    
    @IBOutlet weak var tbl_view: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tbl_view.delegate = self
//        tbl_view.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tbl_view.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.tbl_view.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tbl_view.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize"
        {

                if let  newvalue = change?[.newKey]{
                    let newsize = newvalue as! CGSize
                    self.tbl_height.constant = newsize.height
//                    self.tbl_height.constant = 1000
//                    print("dcm \(self.tbl_height.constant)")
                }

        }
    }
    
}

extension NestedTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as? UITableViewCell
        {
          
            return cell
        }
        return UITableViewCell()

    }
    
    
}
