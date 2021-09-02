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

    private var timer: Timer?
    private var countSeconds = 30
    private let tips = "本应用不含任何网络通信功能，密码经加密之后仅保存在设备上，不会上传到任何网络存储介质，您可以放心使用！如果依旧不放心，可以在您设备飞行模式下使用本应用！"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackground
        navigationItem.title = "密码箱"
        // Do any additional setup after loading the view.
        setupShadow()
        randomNumber()
        timerProgressView.progress = 0.0
        //  设置已走过的进度条颜色
        timerProgressView.progressTintColor = .mainThemeColor
        //  设置未走过进度的进度条颜色
        timerProgressView.trackTintColor = .systemGray5
        timer = initTimer()
        // 设置tips
        tipsLabel.text = tips
        // 设置UICollectionView
//        collectionView.dataSource = self
//        collectionView.delegate = self
        // 添加Button
        floatButton.layer.cornerRadius = 20
        floatButton.backgroundColor = .mainThemeColor
        view.addSubview(floatButton)
        floatButton.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: BUTTON_WIDTH, height: BUTTON_HEIGHT))
            make.bottomMargin.equalTo(-25)
            make.rightMargin.equalTo(-10)
        }
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
    }

    @IBAction func addSecret(_ sender: Any) {

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
