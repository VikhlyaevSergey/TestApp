//
//  UIViewController+Alert.swift
//  Welli
//
//  Created by Alexander Perechnev on 12/12/2018.
//  Copyright © 2018 Innova Group. All rights reserved.
//

import UIKit

extension UIViewController {

    // FIXME: FONTS!
    func showInformationAlertWith (title: String,
                                   message: String,
                                   firstButtonTitle: String? = "ОК",
                                   andActionForFirstButtonHandler: ((UIAlertAction)->())?,
                                   secondButtonTitle: String? = nil,
                                   andSecondAction: ((UIAlertAction)->())? = nil) {

        /*guard */ let font1 = UIFont.boldSystemFont(ofSize: 15)//(name: "MullerBold", size: 15) else { return }

        /*guard */let font2 = UIFont.systemFont(ofSize: 15)//(name: "MullerRegular", size: 14) else { return }

        let attribTitle = NSAttributedString(string: title,
                                             attributes: [.kern: 0.5, NSAttributedString.Key.font : font1])

        let attribMessage = NSAttributedString(string: message,
                                               attributes: [.kern: 0.5, NSAttributedString.Key.font : font2])

        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        alert.view.tintColor = .black

        alert.setValue(attribMessage,
                       forKey: "attributedMessage")

        alert.setValue(attribTitle,
                       forKey: "attributedTitle")

        var title = "ОК"
        if let bt = firstButtonTitle {
            title = bt
        }

        let emptyAction = UIAlertAction(title: title,
                                        style: .default,
                                        handler: nil)

        if let actionHandler = andActionForFirstButtonHandler {
            let action = UIAlertAction(title: firstButtonTitle,
                                       style: .default,
                                       handler: actionHandler)
            alert.addAction(action)
        } else {
            alert.addAction(emptyAction)
        }

        if let secondActionHandler = andSecondAction {
            let action = UIAlertAction(title: secondButtonTitle,
                                       style: .cancel,
                                       handler: secondActionHandler)
            alert.addAction(action)
        } else if secondButtonTitle != nil {
            let action = UIAlertAction(title: secondButtonTitle,
                                       style: .cancel,
                                       handler: nil)
            alert.addAction(action)
        }

        self.present(alert, animated: true, completion: nil)
    }

    func showAlert(withTitle: String, andMessage: String) {
        showInformationAlertWith(title: withTitle,
                                 message: andMessage,
                                 andActionForFirstButtonHandler: nil)
    }

    func showAlert(withError: Error) {
        showAlert(withTitle: withError.localizedDescription, andMessage: "")
    }

    func showAlert(withError: Error, andHandler: @escaping ()->()) {
        showInformationAlertWith(title: withError.localizedDescription, message: "", andActionForFirstButtonHandler: { _ in
            andHandler()
        })
    }

    func showAlert(withInfo: String) {
        showAlert(withTitle: withInfo, andMessage: "")
    }

    // MARK: Rules
    func makeOneBigMessage(messages: [String]) -> String {
        var message = ""
        for msg in messages {
            message += msg
        }
        return message
    }
}
