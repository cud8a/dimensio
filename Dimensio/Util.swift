//
//  Util.swift
//  Dimensio
//
//  Created by Tamas Bara on 05.06.17.
//  Copyright © 2017 Tamas Bara. All rights reserved.
//

import Foundation

extension Array {
    
    subscript (safeIndex index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
