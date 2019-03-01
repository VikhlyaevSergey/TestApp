//
//  WeatherConfigurator.swift
//  Test
//
//  Created by Сергей Вихляев on 25/02/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

import UIKit

class WeatherConfigurator: BaseConfiguratorProtocol {
    func configure(viewController: UIViewController, navigationController: UINavigationController?) {
        let viewController = viewController as! WeatherViewController

        let presenter = WeatherPresenter()
        let interactor = WeatherInteractor()

        presenter.interactor = interactor
        presenter.viewController = viewController
        viewController.presenter = presenter
    }
}
