//
//  ViewController.swift
//  to do
//
//  Created by 森杏菜 on 2023/06/30.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    
    // 2番目のcollectionView
    @IBOutlet  var taskCollectionView: UICollectionView!
    
    // 表示するデータ
    let dataArray = ["Swift","CSS","JavaScript UI","Ruby","HTML","C","Python"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    //セルの中身の表示にかんするコード
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCollectionCell", for: indexPath) as! TaskCollectionViewCell
        
  
        
        
        cell.taskTitleLabel.text = dataArray[indexPath.row]
        cell.taskImageView.image = UIImage(systemName: "person.circle")
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
    // Identifierを指定して画面遷移する
    performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
}

