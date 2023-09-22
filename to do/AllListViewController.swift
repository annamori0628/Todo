//
//  File.swift
//  to do
//
//  Created by 森杏菜 on 2023/08/25.
//

import UIKit

class AllListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    @IBOutlet var addButton: UIButton!
    var selectedIndex: Int!
    
    
    
    var array = [[String]]()
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Viewの表示時にUserDefaultsから最新データリスト取得する
        
        array = saveData.object(forKey: "todo_data_task") as! [[String]]
        // TableViewの更新
        
        table.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array[selectedIndex].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = array[selectedIndex][indexPath.row]
        return cell!
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddTodo" {
            let nextVC = segue.destination as! AddViewController
            nextVC.selectedIndex = selectedIndex
        }
    }
    @IBAction func tap(){
        performSegue(withIdentifier: "AddTodo", sender: nil)
    }
}
