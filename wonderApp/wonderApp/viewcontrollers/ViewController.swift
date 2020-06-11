//
//  ViewController.swift
//  wonderApp
//
//  Created by Khin Yadanar Thein on 13/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewWonder: UITableView!
    
    private var wonderList : [WonderVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewWonder.delegate = self
        tableViewWonder.dataSource = self
        
        //TODO: - register cells
        tableViewWonder.register(UINib(nibName: WonderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: WonderTableViewCell.identifier)
        
        ApiClient.shared.getAllWonderList(success: { (data) in
            
            print(data.wonders.count)
            
            self.wonderList = data.wonders
            self.tableViewWonder.reloadData()
            
        }) { (error) in
            
            print(error)
        }
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let passData = wonderList[indexPath.row]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: SB_NAME, bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        detailVC.cityData = passData
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wonderList.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let photoCell = tableView.dequeueReusableCell(withIdentifier: WonderTableViewCell.identifier, for: indexPath) as? WonderTableViewCell {
            
            photoCell.setData(wonderData: wonderList[indexPath.row])
            return photoCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
}
