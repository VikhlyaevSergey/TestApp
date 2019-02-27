//
//  NetworkActivityIndicatorManager.swift
//  Mimoza
//
//  Created by Сергей Вихляев on 23.07.2018.
//  Copyright © 2018 Сергей Вихляев. All rights reserved.
//

import Foundation
import UIKit

class NetworkActivityIndicatorManager: NSObject {
  private static var loadingCount = 0

  class func networkOperationStarted() {
    if loadingCount == 0 {
      UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    loadingCount += 1
  }

  class func  networkOperationFinished() {
    if loadingCount > 0 {
      loadingCount -= 1
    }

    if loadingCount == 0 {
      UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
  }
}
