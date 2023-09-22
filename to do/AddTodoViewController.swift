//
//  AddTodoViewController.swift
//  to do
//
//  Created by 森杏菜 on 2023/08/25.
//

import UIKit

class AddTodoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var cameraImageView: UIImageView!
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet weak var menuButton: UIButton!
    var originalImage: UIImage!
    enum MenuType: String {
        case take = "写真を撮る"
        case album = "写真を選択"
        
    }
    // メニュー選択ボタン
    
    
    // 選択されたMenuType
    var selectedMenuType = MenuType.album
    
    
    var array = [[String: Any]]()
    var saveData: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureMenuButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        array = saveData.object(forKey: "todo_data") as! [[String: Any]]
    }
    
    private func configureMenuButton() {
        var actions = [UIMenuElement]()
        // HIGH
        actions.append(UIAction(title: MenuType.take.rawValue, image: nil, state: self.selectedMenuType == MenuType.take ? .on : .off,
                                handler: { (_) in
            self.selectedMenuType = .take
            
            
            
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                
                let picker =  UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                
                picker.allowsEditing = true
                
                self.present(picker, animated: true, completion: nil)
            }else {
                print("error")
            }
            
            
            
            // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
            self.configureMenuButton()
        }))
        // MID
        actions.append(UIAction(title: MenuType.album.rawValue, image: nil, state: self.selectedMenuType == MenuType.album ? .on : .off,
                                handler: { (_) in
            self.selectedMenuType = .album
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                
                let picker = UIImagePickerController ()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                
                picker.allowsEditing = true
                
                self.present (picker, animated: true, completion: nil)
            }
            
            // UIActionのstate(チェックマーク)を更新するためにUIMenuを再設定する
            self.configureMenuButton()
        }))
        
        // UIButtonにUIMenuを設定
        menuButton.menu = UIMenu(title: "", options: .displayInline, children: actions)
        // こちらを書かないと表示できない場合があるので注意
        menuButton.showsMenuAsPrimaryAction = true
        // ボタンの表示を変更
        
    }
    
    @IBAction func addTodotext(){
        
        let addData: [String: Any] = [
            "title": todoTextField.text as Any,
            "image": originalImage.pngData() as NSData? as Any
        ]
        
        // 今のarrayにtextFieldの値を追加する
        array.append(addData)
        
        // 新しい値の入ったarrayをUserDefaultsに上書きする
        // 保存するためのkeyが同じなので上書きされる!
        saveData.set(array, forKey: "todo_data")
   
        //追記
        var todoDataArray = saveData.object(forKey: "todo_data_task") as! [[String]]
        let emptyArray = [String]()
        todoDataArray.append(emptyArray)
        saveData.set (todoDataArray, forKey: "todo_data_task")
      
      
        // 1つ前 に戻る場合
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func takePhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        }else{
            print("error")
        }
    }
    
    @IBAction func openAlbum(){
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true, completion: nil)
        originalImage = info[.editedImage]as? UIImage
        cameraImageView.image = info[.editedImage]as? UIImage
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

