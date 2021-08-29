//
//  Constant.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/27.
//

import DefaultsKit
import Foundation

let SCREEN_WIDTH = UIScreen.main.bounds.size.width // 设备屏幕宽
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height // 设备屏幕高
let DATA_SCHEMA_VERSION = UInt64(0) // Realm数据库版本

let loginModeKey = Key<String>("LoginModel") // 0-无密码，1-指纹，2-手势，3-数字

let SETTINGS_TITLE_ARRAY = ["隐私设置", "导出数据", "导入数据", "关于应用"]
let SETTINGS_IMAGE_ARRAY = [
    "hand.raised.fill",
    "folder.fill.badge.minus",
    "folder.fill.badge.plus",
    "info.circle.fill"
]

let LOGIN_MODE_TITLE_ARRAY = ["允许应用截屏", "启用数字密码", "启用手势密码", "启用指纹密码", "关闭所有密码"]
let LOGIN_MODE_IMAGE_ARRAY = [
    "photo.fill.on.rectangle.fill",
    "0.circle.fill",
    "square.grid.3x3.middle.fill",
    "touchid",
    "person.crop.circle.badge.xmark.fill"
]
