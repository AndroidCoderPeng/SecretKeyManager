//
//  LoginModeViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/29.
//

import DefaultsKit
import UIKit

class LoginModeViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    private let defaults = Defaults.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackground
        navigationItem.title = SETTINGS_TITLE_ARRAY[0]
        // Do any additional setup after loading the view.
        tableView.register(
                UINib(nibName: "LoginModeTableViewCell", bundle: nil),
                forCellReuseIdentifier: "loginModeTableViewCell"
        )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        // 设置已选的解锁方式
        let loginModel = defaults.get(for: loginModeKey)
        switch loginModel {
        case "1":

            break
        case "2":

            break
        case "3":

            break
        default:
            break
        }
    }
}

extension LoginModeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        61
    }
}

extension LoginModeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LOGIN_MODE_TITLE_ARRAY.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LoginModeTableViewCell = tableView.dequeueReusableCell(
                withIdentifier: "loginModeTableViewCell", for: indexPath
        ) as! LoginModeTableViewCell
        if indexPath.row == 4 {
            cell.leftImageView.image = UIImage(
                    systemName: LOGIN_MODE_IMAGE_ARRAY[indexPath.row]
            )?.withRenderingMode(.alwaysOriginal)
        } else {
            cell.leftImageView.image = UIImage(
                    systemName: LOGIN_MODE_IMAGE_ARRAY[indexPath.row]
            )
        }
        cell.titleLableView.text = LOGIN_MODE_TITLE_ARRAY[indexPath.row]
        cell.selectionStyle = .none
        cell.rightSwitchView.tag = indexPath.row
        cell.rightSwitchView.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        return cell
    }

    @objc func switchAction(_ sender: UISwitch) {
        switch sender.tag {
        case 0:
            // 截屏开关
            break
        case 1:
            // 数字密码
            if sender.isOn {
                defaults.set("3", for: loginModeKey)
            } else {
            }
            break
        case 2:
            // 手势密码
            if sender.isOn {
                defaults.set("2", for: loginModeKey)
            } else {
            }
            break
        case 3:
            // 指纹密码
            if sender.isOn {
                defaults.set("1", for: loginModeKey)
            } else {
            }
            break
        case 4:
            // 关闭密码
            if sender.isOn {
                defaults.set("0", for: loginModeKey)
            } else {
                defaults.set("3", for: loginModeKey)
            }
            break
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
}
