//
//  LoginViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/29.
//

import DefaultsKit
import UIKit

class LoginViewController: UIViewController {
    private let defaults = Defaults.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginModel = defaults.get(for: loginModeKey)
        switch loginModel {
        case "1":
            FingureCheckTool.authenticate { result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        AppCoordinator.shared.setTabbarScreen()
                    }
                case .fialed:
                    print("失败")
                case .passwordNotSet:
                    print("未设置密码")
                case .touchIDNotSet:
                    print("未设置指纹")
                case .touchIDNotAvaliable:
                    print("系统不支持")
                default:
                    break
                }
            }
            break
        case "2":
            print("手势解锁")
            break
        case "3":
            print("数字解锁")
            break
        default:
            AppCoordinator.shared.setTabbarScreen()
            break
        }
    }
}
