//
//  FingerAuth.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/27.
//

import Foundation
import LocalAuthentication

enum FingureCheckResult {
    case success // 成功
    case fialed // 失败
    case passwordNotSet // 未设置手机密码
    case touchIDNotSet // 未设置指纹
    case touchIDNotAvaliable // 不支持指纹
    case systemCancel // 系统取消
    case userCancel // 用户取消
    case inputPassword // 输入密码
}

class FingureCheckTool: NSObject {
    static func authenticate(withTips tips: String = "验证指纹", block: @escaping (_ result: FingureCheckResult) -> Void) {
        guard #available(iOS 8.0, *) else {
            block(.touchIDNotAvaliable)
            return
        }
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(LAPolicy(rawValue: Int(kLAPolicyDeviceOwnerAuthenticationWithBiometrics))!, error: &error) {
            context.evaluatePolicy(LAPolicy(rawValue: Int(kLAPolicyDeviceOwnerAuthenticationWithBiometrics))!, localizedReason: tips, reply: { success, error in
                if success {
                    block(.success)
                    print("指纹验证成功")
                } else {
                    let laError = error as! LAError
                    switch laError.code {
                    case .authenticationFailed:
                        block(.fialed)
                        print("连续三次输入错误，身份验证失败")
                    case .userCancel:
                        block(.userCancel)
                        print("用户点击取消按钮")
                    case .userFallback:
                        block(.inputPassword)
                        print("用户点击输入密码")
                    case .systemCancel:
                        block(.systemCancel)
                        print("系统取消")
                    case .passcodeNotSet:
                        block(.passwordNotSet)
                        print("用户未设置密码")
                    case .touchIDNotAvailable:
                        block(.touchIDNotAvaliable)
                        print("touchID不可用")
                    case .touchIDNotEnrolled:
                        block(.touchIDNotSet)
                        print("touchID未设置指纹")
                    default:
                        break
                    }
                }
            })
        } else {
            print("不支持TouchID")
        }
    }
}
