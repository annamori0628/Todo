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
    
    
    
    var array = [String]()
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        
        // 今回はUserDefaultsに保存したデータを使うので空にする!
        array = []
        
        // UserDefaultsに「空のデータ配列(array)」を
        //        「array_data」をいう名前でセットする
        saveData.set(array, forKey: "todo_data")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Viewの表示時にUserDefaultsから最新データリスト取得する
        
        array = saveData.object(forKey: "todo_data") as! [String]
        // TableViewの更新
        
        table.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = array[indexPath.row]
        return cell!
        
    }
}
