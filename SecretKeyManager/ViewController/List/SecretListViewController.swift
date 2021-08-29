//
//  SecretListViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/27.
//

import UIKit

class SecretListViewController: UIViewController {
    @IBOutlet var secretTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackground
        navigationItem.title = "密码列表"
        // Do any additional setup after loading the view.
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
