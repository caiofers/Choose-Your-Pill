//
//  PhrasesManager.swift
//  Choose Your Pill
//
//  Created by Caio Fernandes on 22/06/21.
//

import SwiftUI
import CoreData

extension Phrase {
    var pillType: PillType {
        set {
            pill = newValue.rawValue
        }
        get {
            PillType(rawValue: pill ?? "") ?? .red
        }
    }
}

enum PillType: String {
    case red
    case blue
}
