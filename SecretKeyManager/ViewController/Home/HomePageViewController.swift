//
//  HomePageViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/27.
//

import SnapKit
import SwiftRandom
import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet var topView: UIView!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var fourthLabel: UILabel!
    @IBOutlet var fifthLabel: UILabel!
    @IBOutlet var sixLabel: UILabel!
    @IBOutlet var timerProgressView: UIProgressView!
    @IBOutlet var tipsLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var floatButton: UIButton!

    private let notificationCenter = NotificationCenter.default
    private var timer: Timer?
    private var countSeconds = 30
    private let tips = "本应用不含任何网络通信功能，密码经加密之后仅保存在设备上，不会上传到任何网络存储介质，您可以放心使用！如果依旧不放心，可以在您设备飞行模式下使用本应用！"
    private var valueDelegate: TransferValueDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackground
        navigationItem.title = "密码箱"
        // Do any additional setup after loading the view.
        setupShadow()
        // 设置tips
        tipsLabel.text = tips
        // 设置UICollectionView
//        collectionView.dataSource = self
//        collectionView.delegate = self
        // 添加Button
        floatButton.layer.cornerRadius = 25
        floatButton.backgroundColor = .mainThemeColor
        view.addSubview(floatButton)
        floatButton.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.bottomMargin.equalTo(-25)
            make.rightMargin.equalTo(-10)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        randomNumber()
        timerProgressView.progress = 0.0
        //  设置已走过的进度条颜色
        timerProgressView.progressTintColor = .mainThemeColor
        //  设置未走过进度的进度条颜色
        timerProgressView.trackTintColor = .systemGray5
        timer = initTimer()
        // 监听扫码结果
        notificationCenter.addObserver(forName: .scanResultNotification, object: nil, queue: .main, using: { [self] notification in
            let alertController = UIAlertController(title: "扫描结果", message: notification.object as? String, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "知道了", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        })
    }

    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
        timer = nil
    }

    func setupShadow() {
        LayerShadowHub.shared.setViewShadow(view: topView, sColor: .white, radius: 5.0)
        LayerShadowHub.shared.setLabelShadow(view: firstLabel, sColor: .systemGray5, radius: 5.0)
        LayerShadowHub.shared.setLabelShadow(view: secondLabel, sColor: .systemGray5, radius: 5.0)
        LayerShadowHub.shared.setLabelShadow(view: thirdLabel, sColor: .systemGray5, radius: 5.0)
        LayerShadowHub.shared.setLabelShadow(view: fourthLabel, sColor: .systemGray5, radius: 5.0)
        LayerShadowHub.shared.setLabelShadow(view: fifthLabel, sColor: .systemGray5, radius: 5.0)
        LayerShadowHub.shared.setLabelShadow(view: sixLabel, sColor: .systemGray5, radius: 5.0)
    }

    func randomNumber() {
        firstLabel.text = String(Int.random(0, 9))
        secondLabel.text = String(Int.random(0, 9))
        thirdLabel.text = String(Int.random(0, 9))
        fourthLabel.text = String(Int.random(0, 9))
        fifthLabel.text = String(Int.random(0, 9))
        sixLabel.text = String(Int.random(0, 9))
    }

    // 倒计时
    @objc func countDownTimer() {
        if countSeconds < 1 {
            timer?.invalidate()
            timer = nil
            // 倒计时结束，更改六个Label的数字
            randomNumber()
            timerProgressView.setProgress(Float(0), animated: true)
            countSeconds = 30
            timer = initTimer()
        }
        countSeconds -= 1
        timerProgressView.setProgress(Float(countSeconds), animated: true)
    }

    private func initTimer() -> Timer {
        Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(countDownTimer),
                userInfo: nil,
                repeats: true
        )
    }

    @IBAction func scanQrCode(_ sender: Any) {
        let scannerController = ScannerViewController()
        scannerController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(scannerController, animated: true)
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @IBAction func addSecretAction(_ sender: Any) {
        let actionSheetController = UIAlertController()
        actionSheetController.addAction(UIAlertAction(title: "添加账号", style: .default, handler: { [self] _ in
            addSecret()
        }))
        actionSheetController.addAction(UIAlertAction(title: "搜索账号", style: .default, handler: { [self] _ in
            searchSecret()
        }))
        actionSheetController.addAction(UIAlertAction(title: "取消", style: .cancel))
        present(actionSheetController, animated: true, completion: nil)
    }

    private func addSecret() {
        let addController = AddSecretViewController()
        addController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addController, animated: true)
    }

    private func searchSecret() {
        var inputText: UITextField!
        let msgAlertCtr = UIAlertController(title: "搜索账号", message: nil, preferredStyle: .alert)
        msgAlertCtr.addTextField { textField in
            inputText = textField
            inputText.placeholder = "请输入要搜索的账号"
        }
        let actionOK = UIAlertAction(title: "搜索", style: .default) { [self] (_: UIAlertAction) -> Void in
            let keyword = inputText.text
            if keyword == "" {
                return
            }

            let resultController = ResultListViewController()
            // 委托代理
            valueDelegate = resultController
            let transferDic: NSDictionary = ["keyword": keyword!]
            valueDelegate.transfer(controller: self, dic: transferDic)
            resultController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(resultController, animated: true)
        }
        let actionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        // 设置取消按钮颜色为红色
        actionCancel.setValue(UIColor.red, forKey: "titleTextColor")
        msgAlertCtr.addAction(actionOK)
        msgAlertCtr.addAction(actionCancel)
        present(msgAlertCtr, animated: true, completion: nil)
    }
}

// extension HomePageViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return
//    }
// }
//
// extension HomePageViewController: UICollectionViewDelegate {
// }
