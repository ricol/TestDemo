//
//  extensions.swift
//  TestDemo
//
//  Created by Ricol Wang on 10/4/20.
//  Copyright © 2020 Ricol Wang. All rights reserved.
//

import Foundation
import UIKit
import SwiftHEXColors

extension UIColor
{
    static func appTextFieldContent() -> UIColor
    {
        return UIColor(hexString: "E5E5E5") ?? UIColor.white
    }
    
    static func appTextFieldPlaceholder() -> UIColor
    {
        return UIColor(hexString: "7B7B7B") ?? UIColor.lightGray
    }
}
