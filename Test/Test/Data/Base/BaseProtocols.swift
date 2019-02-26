//
//  BaseProtocols.swift
//  Test
//
//  Created by Сергей Вихляев on 24/02/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

import UIKit

protocol BaseConfiguratorProtocol {
    func configure(viewController: UIViewController)
}

protocol BaseViewNavigationProtocol {
    var navController: UINavigationController? { get set }
    static var kStoryboardID: String { get set }
}

protocol BaseViewProtocol {
    func showInfoAlert(_ info: String)
    func showErrorAlert(_ error: Error)
}
