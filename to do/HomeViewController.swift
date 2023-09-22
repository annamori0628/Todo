//
//  ViewController.swift
//  to do
//
//  Created by 森杏菜 on 2023/06/30.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var array = [[String: Any]]()
    var saveData: UserDefaults = UserDefaults.standard
    var selectedIndex: Int!
    // 2番目のcollectionView
    @IBOutlet  var taskCollectionView: UICollectionView!
    
    
    // 表示するデータ
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //データがないときに初期化する
        if (saveData.object(forKey: "todo_data") == nil){
            saveData.set(array, forKey: "todo_data")
            saveData.set(array, forKey: "todo_data_task")
        }
        // delegate,dataSourceをそれぞれ指定する
        taskCollectionView.delegate = self
        taskCollectionView.dataSource = self
        
        
        // それぞれのカスタムセルを登録
        taskCollectionView.register(UINib(nibName: "TaskCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TaskCollectionCell")
        
        // collectionViewの表示設定
        let layout = UICollectionViewFlowLayout()
        // セルの大きさを設定
        layout.itemSize = CGSize(width: 140, height: 140)
        // collectionViewの内側余白をつける
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        // それぞれに表示設定を適応させる
        taskCollectionView.collectionViewLayout = layout
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        array = saveData.object(forKey: "todo_data") as! [[String: Any]]
        taskCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    //セルの中身の表示にかんするコード
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCollectionCell", for: indexPath) as! TaskCollectionViewCell
        
        
        
        
        cell.taskTitleLabel.text = array[indexPath.row]["title"] as? String
        cell.taskImageView.image = UIImage(data: (array[indexPath.row]["image"] as! NSData) as Data)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        // Identifierを指定して画面遷移する
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let nextVC = segue.destination as! AllListViewController
            nextVC.selectedIndex = selectedIndex
        }
    }
    
}

