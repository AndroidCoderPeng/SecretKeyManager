//
//  TransferValueDelegate.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/9/3.
//

import Foundation
import UIKit

protocol TransferValueDelegate: NSObjectProtocol {
    // 传递字典类型数据
    func transfer(controller: UIViewController, dic: NSDictionary)
}
