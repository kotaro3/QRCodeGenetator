//
// Created by kotaro on 2018/03/04.
// Copyright (c) 2018 kotaro. All rights reserved.
//

import Foundation

public enum ErrorCorrection {
    case L // 7%
    case M // 15%
    case Q // 25%
    case H // 30%

    func level() -> String {
        switch self {
        case .L:
            return "L"
        case .M:
            return "M"
        case .Q:
            return "Q"
        case .H:
            return "H"
        }
    }
}
