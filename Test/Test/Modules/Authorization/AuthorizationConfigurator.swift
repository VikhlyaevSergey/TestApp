//
//  AuthorizationConfigurator.swift
//  Test
//
//  Created by Сергей Вихляев on 25/02/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

import UIKit

class AuthorizationConfigurator : BaseConfiguratorProtocol {
    func configure(viewController: UIViewController, navigationController: UINavigationController?) {
        let viewController = viewController as! AuthorizationViewController

        let presenter = AuthorizationPresenter()
        let interactor = AuthorizationInteractor()
        let router = AuthorizationRouter(withNavigationController: navigationController)

        presenter.interactor = interactor
        presenter.router = router
        presenter.viewController = viewController
        viewController.presenter = presenter
    }
}
