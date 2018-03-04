//
// Created by kotaro on 2018/03/04.
// Copyright (c) 2018 kotaro. All rights reserved.
//

import Foundation
import UIKit

public protocol QRCodeViewType {
    func generate(withData string: String, encoding: String.Encoding, correctionLevel: ErrorCorrection)
}
