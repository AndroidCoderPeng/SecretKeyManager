//
//  SettingsViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/27.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackground
        navigationItem.title = "设置中心"
        // Do any additional setup after loading the view.
        tableView.register(
                UINib(nibName: "SettingsTableViewCell", bundle: nil),
                forCellReuseIdentifier: "settingsTableViewCell"
        )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了\(SETTINGS_TITLE_ARRAY[indexPath.row])")
        switch indexPath.row {
        case 0:
            let loginModeController = LoginModeViewController()
            // 由底部带有item的页面跳转之后隐藏底部bar
            loginModeController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(loginModeController, animated: true)
            break
        case 1:
            print("导出数据")
            break
        case 2:
            print("导入数据")
            break
        case 3:
            let aboutController = AboutViewController()
            aboutController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(aboutController, animated: true)
            break
        default:
            break
        }
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SETTINGS_TITLE_ARRAY.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SettingsTableViewCell = tableView.dequeueReusableCell(
                withIdentifier: "settingsTableViewCell", for: indexPath
        ) as! SettingsTableViewCell
        if indexPath.row == 0 || indexPath.row == 3 {
            cell.leftImageView.image = UIImage(
                    systemName: SETTINGS_IMAGE_ARRAY[indexPath.row]
            )
        } else {
            cell.leftImageView.image = UIImage(
                    systemName: SETTINGS_IMAGE_ARRAY[indexPath.row]
            )?.withRenderingMode(.alwaysOriginal)
        }
        cell.titleLableView.text = SETTINGS_TITLE_ARRAY[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
}
