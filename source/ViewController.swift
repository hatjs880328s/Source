//
//  ViewController.swift
//  source
//
//  Created by Noah_Shan on 2018/3/13.
//  Copyright © 2018年 Inspur. All rights reserved.
//

import UIKit
import Foundation

class BASEViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var btn = UIButton()
    var customTB = UITableView()
    
    let threadList = IISlinkManager(linkname: "test the memcache")
    
    
    //noti-center
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        btn.frame = self.view.frame
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(self.go), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(customTB)
        customTB.frame = self.view.frame
        customTB.delegate = self
        customTB.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @objc func go() {
        //self.navigationController?.pushViewController(TwoViewController(), animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "reuseID")
        cell.textLabel?.text = "\(indexPath.row + 1)"
        cell.selectionStyle = UITableViewCellSelectionStyle.blue
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let con = TwoViewController()
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    deinit {
        customTB.delegate = nil
        customTB.dataSource = nil
        DEBUGPrintLog("base -vc -deinit")
    }
}
