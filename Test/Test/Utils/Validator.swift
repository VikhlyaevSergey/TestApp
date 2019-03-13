//
//  Validator.swift
//  Test
//
//  Created by Сергей Вихляев on 13/03/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

import Foundation

class Validator {

    func isValidEmail(text: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: text)
    }

    func isValidPassword(text : String) -> Bool{
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: text)


        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: text)


        let specialCharacterRegEx  = ".*[a-z]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)

        let specialresult = texttest2.evaluate(with: text)

        let moreWhan6 = text.count > 6

        return capitalresult && numberresult && specialresult && moreWhan6
    }
}
