//
//  ScannerViewController.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/9/2.
//

import AVFoundation
import UIKit

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    // 私有变量
    private var device: AVCaptureDevice!
    private var input: AVCaptureInput!
    private var output: AVCaptureMetadataOutput!
    private var session: AVCaptureSession!
    private var preview: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = "扫一扫"
        // Do any additional setup after loading the view.
        // Device
        device = AVCaptureDevice.default(for: AVMediaType.video)
        // Input
        do {
            input = try AVCaptureDeviceInput(device: device)
        } catch {
            print("Input 初始化失败")
            return
        }
        // Output
        output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: .main)
        // 需要自定义一个扫码区域，感兴趣的区域，设置为中心，否则全屏可扫
        output.rectOfInterest = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        // Session
        session = AVCaptureSession()
        session.sessionPreset = AVCaptureSession.Preset.high
        if session.canAddInput(input) {
            session.addInput(input)
        } else {
            print("Session Add Input 初始化失败")
            return
        }
        if session.canAddOutput(output) {
            session.addOutput(output)
        } else {
            print("Session Add Output 初始化失败")
            return
        }
        // 条码类型 AVMetadataObjectTypeQRCode
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        // Preview
        preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = AVLayerVideoGravity.resizeAspectFill
        preview.frame = view.layer.bounds
        view.layer.insertSublayer(preview, at: 0)
        // Start
        session.startRunning()
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        var stringValue: String?
        if metadataObjects.count > 0 {
            // 停止扫描
            session.stopRunning()
            if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
                stringValue = metadataObject.stringValue
            }
        }
        navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name: .scanResultNotification, object: stringValue!)
    }
}
