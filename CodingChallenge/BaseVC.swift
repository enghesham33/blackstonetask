//
//  BaseVC.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import UIKit
import SVProgressHUD
import Toast_Swift

class BaseView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoader() {
        SVProgressHUD.show()
    }

    func hideLoader() {
        SVProgressHUD.dismiss()
    }

    func showErrorMessage(message: String) {
        self.view.makeToast(message)
    }
}
