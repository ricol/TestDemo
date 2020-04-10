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

typealias Block = () -> Void
typealias ImageProcessProc = (UIImage) -> Void

extension UIImage
{
    static var cache = NSCache<NSString, UIImage>()
    
    func blurEffect(key: String, radius: Int = 25, complete: @escaping ImageProcessProc)
    {
        if let image = UIImage.cache.object(forKey: key as NSString)
        {
            complete(image)
            return
        }
        
        if let beginImage = CIImage(image: self)
        {
            DispatchQueue.global().async {
                if let currentFilter = CIFilter(name: "CIGaussianBlur"), let cropFilter = CIFilter(name: "CICrop")
                {
                    currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
                    currentFilter.setValue(radius, forKey: kCIInputRadiusKey)
                    cropFilter.setValue(currentFilter.outputImage, forKey: kCIInputImageKey)
                    cropFilter.setValue(CIVector(cgRect: beginImage.extent), forKey: "inputRectangle")

                    if let output = cropFilter.outputImage
                    {
                        if let cgimg = CIContext(options: nil).createCGImage(output, from: output.extent)
                        {
                            let processedImage = UIImage(cgImage: cgimg)
                            UIImage.cache.setObject(processedImage, forKey: key as NSString)
                            DispatchQueue.main.async {
                                complete(processedImage)
                            }
                        }
                    }
                }
            }
        }
    }
}
