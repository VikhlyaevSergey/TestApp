//
//  EnterConfigurator.swift
//  Test
//
//  Created by Сергей Вихляев on 24/02/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

import UIKit

final class EnterConfigurator: BaseConfiguratorProtocol {
    func configure(viewController: UIViewController, navigationController: UINavigationController?) {
        let viewController = viewController as! EnterViewController

        let presenter = EnterPresenter()
        let interactor = EnterInteractor()
        let router = EnterRouter(withNavigationController: navigationController)

        presenter.interactor = interactor
        presenter.router = router
        presenter.viewController = viewController
        viewController.presenter = presenter
    }
}
