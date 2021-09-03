//
//  ResultListViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/9/3.
//

import UIKit

class ResultListViewController: UIViewController {
    private var keyword: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackground
        navigationItem.title = "搜索结果"
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        print(keyword)
    }
}

extension ResultListViewController: TransferValueDelegate {
    func transfer(controller: UIViewController, dic: NSDictionary) {
        keyword = dic["keyword"] as? String
    }
}
