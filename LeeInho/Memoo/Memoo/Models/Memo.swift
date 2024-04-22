//
//  Memo.swift
//  Memoo
//
//  Created by 이인호 on 4/22/24.
//

import Foundation
import SwiftUI
import SwiftData


@Model
class Memo {
    var id: UUID = UUID()
    var text: String
    var color: String
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
    
    init(text: String, color: String, created: Date) {
        self.text = text
        self.color = color
        self.created = created
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

