//
//  ViewController.swift
//  FMDBTest
//
//  Created by Khin Yadanar Thein on 16/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewNameList: UITableView!
    
    let model = SQLiteDataModel.shared
    
    var nameList : [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewNameList.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        
        tableViewNameList.delegate = self
        tableViewNameList.dataSource = self
        
        reloadTable()
    }
    
    func reloadTable(){
        nameList = model.getPeople()
        tableViewNameList.reloadData()
    }
    
    @IBAction func onTapAdd(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Name", message: "Please Add new name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            
            guard let textField = alert.textFields?.first ,
                let nameToSave = textField.text else {
                return
            }

            self.save(name: nameToSave)
            self.reloadTable()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField { (text) in
            text.placeholder = "Name"
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    private func save(name : String) {
        model.addName(name: name)
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.model.deleteName(id: self.nameList[indexPath.row].id)
            reloadTable()
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListTableViewCell.identifier), for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.textLabel?.text = nameList[indexPath.row].name
        
        return cell
    }
    
    
}
