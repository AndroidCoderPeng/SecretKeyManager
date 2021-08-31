//
//  PrivacyViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/31.
//

import SnapKit
import UIKit

class PrivacyViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackground
        navigationItem.title = ABOUT_TITLE_ARRAY[1]
        // Do any additional setup after loading the view.
        let scrollView = UIScrollView(frame: view.frame)
        scrollView.backgroundColor = .mainThemeColor
        scrollView.indicatorStyle = .default
        label.configTextStyle(text: "尊重用户个人隐私是本应用的一项基本政策。您在使用本应用前仔细阅读并确认您已经充分理解本隐私政策所写明的内容，并接受所有的服务条款。我们十分注重保护用户的个人信息及隐私安全，并尽最大努力全力保护您的隐私。", isFirst: true)
        scrollView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.width.equalToSuperview()
        }

        label1.configTextStyle(text: "1、本应用仅获取使用者设备的存储权限，当做私人密码加密后的数据存储使用，不会用作其他任何用途，更不会上传到任何云服务器，不会泄漏到互联网。", isFirst: false)
        scrollView.addSubview(label1)
        label1.snp.makeConstraints { make in
            make.top.equalTo(5 + label.frame.height)
            make.width.equalToSuperview()
        }

        label2.configTextStyle(text: "2、本应用仅在添加“银行卡”账号信息的时候涉及到网络，因为此功能需要用到OCR（光学字符识别）技术，此技术需要用到网络开源库，所以需要联网。但是此功能不会涉及任何网络通信功能，可放心使用。如果仍不放心，那么可以禁止《密码管家》网络相关权限，除了此处提到的OCR功能会有影响以外，其他功能不会有任何影响。", isFirst: false)
        scrollView.addSubview(label2)
        label2.snp.makeConstraints { make in
            make.top.equalTo(5 + label.frame.height + label1.frame.height)
            make.width.equalToSuperview()
        }

        label3.configTextStyle(text: "3、本应用不会向任何第三方提供、出售、出租、分享或交易您的账号密码信息。", isFirst: false)
        scrollView.addSubview(label3)
        label3.snp.makeConstraints { make in
            make.top.equalTo(5 + label.frame.height + label1.frame.height + label2.frame.height)
            make.width.equalToSuperview()
        }

        label4.configTextStyle(text: "4、应用卸载后将不会留下任何有用信息，所以卸载本应用前一定做好数据迁移和备份操作，一旦操作，数据将无法恢复，数据无价，请谨慎操作。", isFirst: false)
        scrollView.addSubview(label4)
        label4.snp.makeConstraints { make in
            make.top.equalTo(5 + label.frame.height + label1.frame.height + label2.frame.height + label3.frame.height)
            make.width.equalToSuperview()
        }
        view.addSubview(scrollView)
    }
}
