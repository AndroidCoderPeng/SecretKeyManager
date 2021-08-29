//
//  MenuItemModel.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/27.
//

import Foundation
import UIKit

enum MenuItemModel {
    case home
    case list
    case settings

    var name: String {
        switch self {
        case .home: return "密码箱"
        case .list: return "密码列表"
        case .settings: return "设置中心"
        }
    }

    var image: String {
        switch self {
        case .home: return "home"
        case .list: return "list"
        case .settings: return "settings"
        }
    }

    var selectedImage: String {
        switch self {
        case .home: return "home_selected"
        case .list: return "list_selected"
        case .settings: return "settings_selected"
        }
    }

    static var menu: [MenuItemModel] {
        [.home, .list, .settings]
    }
}
