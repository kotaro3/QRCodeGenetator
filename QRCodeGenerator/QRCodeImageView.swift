//
//  QRCodeImageView.swift
//  QRCodeGenerator
//
//  Created by kotaro on 2018/03/04.
//  Copyright © 2018年 kotaro. All rights reserved.
//

import UIKit

public class QRCodeImageView: UIImageView, QRCodeViewType {
    
    private var stringData: Data?
    private var errorCorrection: String = ""

    private func generateCode(data: Data, correctionLevel: String) -> CGImage? {
        let param: [String: Any] = [
            "inputMessage" : data,
            "inputCorrectionLevel": correctionLevel
        ]

        let filter = CIFilter(name: "CIQRCodeGenerator", withInputParameters: param)
        guard let image = filter?.outputImage else {
            return nil
        }

        return CIContext().createCGImage(image, from: image.extent)
    }

    public func generate(withData string: String, encoding: String.Encoding, correctionLevel: ErrorCorrection) {
        self.stringData = string.data(using: encoding)
        self.errorCorrection = correctionLevel.level()
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, true, 0)
        guard let ctx = UIGraphicsGetCurrentContext() else {
            print("Failed: UIGraphicsGetCurrentContext is nil")
            return
        }
        
        guard let data = stringData else {
            print("Failed: Data convert")
            return
        }
        
        guard let image = generateCode(data: data, correctionLevel: errorCorrection) else {
            print("Failed: Generate code image")
            return
        }
        
        ctx.interpolationQuality = .none
        ctx.draw(image, in: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        let resize = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.image = resize
    }
}
