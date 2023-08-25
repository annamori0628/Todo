//
//  AddView.swift
//  to do
//
//  Created by 森杏菜 on 2023/08/25.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    var array = [String]()
    var saveData: UserDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array = saveData.object(forKey: "todo_data") as! [String]
        
    }
    
    
    @IBAction func addItem() {
        
        // 今のarrayにtextFieldの値を追加する
        array.append(textField.text!)
        
        // 新しい値の入ったarrayをUserDefaultsに上書きする
        // 保存するためのkeyが同じなので上書きされる!
        saveData.set(array, forKey: "todo_data")
        
        // 1つ前 に戻る場合
        navigationController?.popViewController(animated: true)
        
    }
}


