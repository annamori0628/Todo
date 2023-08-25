//
//  AccountEditViewController.swift
//  to do
//
//  Created by 森杏菜 on 2023/07/07.
//

import UIKit

class AccountEditViewController: UIViewController {

    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back() {
        dismiss(animated: true)
        
    }
    
    @IBAction func save() {
        
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
