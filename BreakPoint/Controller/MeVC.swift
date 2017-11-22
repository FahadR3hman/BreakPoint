//
//  MeVC.swift
//  BreakPoint
//
//  Created by Fahad Rehman on 11/22/17.
//  Copyright © 2017 Codecture. All rights reserved.
//

import UIKit

class MeVC: UIViewController , UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var meEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func logoutPressed(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
