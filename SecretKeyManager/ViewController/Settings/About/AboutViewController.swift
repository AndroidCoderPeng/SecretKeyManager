//
//  AboutViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/31.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackground
        navigationItem.title = SETTINGS_TITLE_ARRAY[3]
        // Do any additional setup after loading the view.
        tableView.register(
                UINib(nibName: "SettingsTableViewCell", bundle: nil),
                forCellReuseIdentifier: "settingsTableViewCell"
        )
        tableView.register(
                UINib(nibName: "AboutTableViewCell", bundle: nil),
                forCellReuseIdentifier: "aboutTableViewCell"
        )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
}

extension AboutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了\(ABOUT_TITLE_ARRAY[indexPath.row])")
        switch indexPath.row {
        case 0:
            let exonerationController = ExonerationViewController()
            exonerationController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(exonerationController, animated: true)
            break
        case 1:
            let privacyController = PrivacyViewController()
            privacyController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(privacyController, animated: true)
            break
        case 2:
            let logController = UpdateLogViewController()
            logController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(logController, animated: true)
            break
        default:
            break
        }
    }
}

extension AboutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ABOUT_TITLE_ARRAY.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell: AboutTableViewCell = tableView.dequeueReusableCell(
                    withIdentifier: "aboutTableViewCell", for: indexPath
            ) as! AboutTableViewCell
            cell.leftImageView.image = UIImage(
                    named: ABOUT_IMAGE_ARRAY[indexPath.row]
            )?.withRenderingMode(.alwaysOriginal)
            cell.titleLableView.text = ABOUT_TITLE_ARRAY[indexPath.row]
            cell.selectionStyle = .none
            let infoDictionary: [String: Any] = Bundle.main.infoDictionary!
            let mainVersion: Any = infoDictionary["CFBundleShortVersionString"] as Any // 主程序版本号
            cell.rightLabelView.text = (mainVersion as? String)!
            return cell
        } else {
            let cell: SettingsTableViewCell = tableView.dequeueReusableCell(
                    withIdentifier: "settingsTableViewCell", for: indexPath
            ) as! SettingsTableViewCell
            cell.leftImageView.image = UIImage(
                    named: ABOUT_IMAGE_ARRAY[indexPath.row]
            )?.withRenderingMode(.alwaysOriginal)
            cell.titleLableView.text = ABOUT_TITLE_ARRAY[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
}
