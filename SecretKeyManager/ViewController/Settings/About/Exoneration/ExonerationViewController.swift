//
//  ExonerationViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/31.
//

import UIKit

class ExonerationViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackground
        navigationItem.title = ABOUT_TITLE_ARRAY[0]
        // Do any additional setup after loading the view.
        label.configTextStyle(
                text: "本应用本意是方便自己，由于作者本人各种账号密码太多太繁杂，又不放心应用市场上面的各种密码管理软件的安全性，所以只能自己动手开发一个功能类似的软件，方便自己。",
                isFirst: true
        )
        label1.configTextStyle(
                text: "1、所有使用本应用的用户，均已阅读并知晓本声明。如继续使用，将视为同意本声明的内容并且自愿使用。",
                isFirst: false
        )
        label2.configTextStyle(
                text: "2、本人会尽可能的保障本应用自身范围的安全性。",
                isFirst: false
        )
        label3.configTextStyle(
                text: "3、本应用提供密码管理功能，会尽可能的做到数据安全，但因为是单方面测试和小范围使用，如有泄露本应用开发者将不负任何法律责任，所以，使用本应用前请慎重！",
                isFirst: false
        )
        label4.configTextStyle(
                text: "4、本应用不会产生任何流量费用，用户可放心使用。",
                isFirst: false
        )
        label5.configTextStyle(
                text: "5、本声明未涉及到的问题请参见国家相关法律法规，当本声明与国家有关法律法规冲突时，以国家法律法规为准。",
                isFirst: false
        )
        label6.configTextStyle(
                text: "6、本人享有此应用百分百的拥有权，包括但不局限此应用的源码和设计灵感。",
                isFirst: false
        )
    }
}
