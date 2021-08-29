//
//  AppCoordinator.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/27.
//

import Foundation
import IQKeyboardManagerSwift
import UIKit

enum TabBarSelectedType {
    case home
    case list
    case settings
}

class AppCoordinator {
    static let shared = AppCoordinator()
    private let keyboardManager = IQKeyboardManager.shared
    private var tabBarController: UITabBarController!
    private var window: UIWindow?

    private var homePageController: HomePageViewController = {
        let vc = HomePageViewController()
        return vc
    }()

    private var listPageController: SecretListViewController = {
        let vc = SecretListViewController()
        return vc
    }()

    private var settingsPageController: SettingsViewController = {
        let vc = SettingsViewController()
        return vc
    }()

    func appDidFinishLaunching(window: UIWindow) {
        self.window = window
        keyboardManager.enable = true
        keyboardManager.keyboardDistanceFromTextField = 28
        keyboardManager.shouldResignOnTouchOutside = true
        keyboardManager.toolbarDoneBarButtonItemText = "完成"
        window.rootViewController = LoginViewController()
    }

    func setTabbarScreen() {
        let home = UINavigationController(rootViewController: homePageController)
        let list = UINavigationController(rootViewController: listPageController)
        let settings = UINavigationController(rootViewController: settingsPageController)
        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        let navControllers = [home, list, settings]
        tabBarController.viewControllers = navControllers

        for nav in navControllers {
            nav.navigationBar.barTintColor = .mainThemeColor // main bar color
            let dict: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            nav.navigationBar.titleTextAttributes = dict // title color
            nav.navigationBar.tintColor = .white // item color
        }

        guard let items = tabBarController.tabBar.items else {
            return
        }
        for (i, m) in zip(items, MenuItemModel.menu) {
            i.title = m.name
            i.image = UIImage(named: m.image)?.withRenderingMode(.alwaysOriginal) // 总是显示原图不被颜色覆盖
            i.selectedImage = UIImage(named: m.selectedImage)?.withRenderingMode(.alwaysOriginal)
        }
        // 改变文字颜色
        UITabBarItem.appearance().setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.gray],
                for: .normal
        )
        UITabBarItem.appearance().setTitleTextAttributes(
                [NSAttributedString.Key.foregroundColor: UIColor.mainThemeColor],
                for: .selected
        )
        window?.rootViewController = tabBarController
    }

    func setupTabBarIndex(index: Int) {
        tabBarController.selectedIndex = index
    }

    func setupTabBar(type: TabBarSelectedType) {
        switch type {
        case .home:
            tabBarController.selectedIndex = 0
        case .list:
            tabBarController.selectedIndex = 1
        case .settings:
            tabBarController.selectedIndex = 2
        }
    }
}
