//
//  TableStaticsViewController.swift
//  SCGHackathon
//
//  Created by Hoang Hiep Ho on 10/27/18.
//  Copyright © 2018 Gamedex. All rights reserved.
//

import UIKit

class TableStaticsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        
        if (indexPath.row == 0){
            cell.Lbl1st.text = "ID"
            cell.Lbl2nd.text = "Material"
            cell.Lbl3rd.text = "Price"
            cell.Lbl4th.text =  "Volume"
            cell.Lbl5th.text = "Quality"
            cell.Lbl6th.text = "Delete"
        } else {
            cell.Lbl1st.text = String(indexPath.row)
            cell.Lbl2nd.text = "Recycled Glass"
            cell.Lbl3rd.text = String(34*indexPath.row)
            cell.Lbl4th.text = String(10000+indexPath.row * 7)
            cell.Lbl5th.text = "Good"
            cell.Lbl6th.text = ""
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.height / 10
    }
}

class tableViewCell : UITableViewCell {
    
    @IBOutlet var Lbl1st: UILabel!
    @IBOutlet var Lbl2nd: UILabel!
    @IBOutlet var Lbl3rd: UILabel!
    @IBOutlet var Lbl4th: UILabel!
    @IBOutlet var Lbl5th: UILabel!
    @IBOutlet var Lbl6th: UILabel!
    override func awakeFromNib() {
        
    }
}



