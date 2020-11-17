//
//  BaseViewController.swift
//  WeatherTask
//
//  Created by Omima Ibrahim on 11/17/20.
//

import Foundation
import SwiftMessages
import GeometricLoaders

protocol BaseViewing: class {
    func showLoader()
    func hideLoader()
    func showSuccessMessage(text: String?)
    func showErrorMessage(text: String?)
}

class BaseViewController: UIViewController, BaseViewing {

    lazy var container: Infinity = {
        return Infinity.createGeometricLoader()
    }()
    
    func showErrorMessage(text: String?) {
        let view = MessageView.viewFromNib(layout: .messageView)
        view.configureTheme(Theme.error, iconStyle: IconStyle.none)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.configureContent(title: nil, body: text, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: nil, buttonTapHandler: nil)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        var config = SwiftMessages.Config.init()
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal.rawValue)
        SwiftMessages.show(config: config, view: view)
    }
    
    func showSuccessMessage(text: String?) {
        let view = MessageView.viewFromNib(layout: .messageView)
        view.configureTheme(Theme.success, iconStyle: IconStyle.none)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.configureContent(title: nil, body: text, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: nil, buttonTapHandler: nil)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        SwiftMessages.show(view: view)
    }
    
    func showLoader() {
        container.circleColor = UIColor.white
        container.startAnimation()
    }
    
    func hideLoader() {
        container.stopAnimation()
    }
}

