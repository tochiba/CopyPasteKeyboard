//
//  Pasteboard.swift
//  CopyPasteKeyboard
//
//  Created by Toshiki Chiba on 2017/03/26.
//  Copyright © 2017年 Toshiki Chiba. All rights reserved.
//
import UIKit
import Foundation
import RealmSwift

enum GenreType: Int {
    case none, text, url, image
}

final class PasteboardEntity: Object {
    dynamic var text = ""
    dynamic var url = ""
    dynamic var image = UIImage()
    dynamic var type = GenreType.none.rawValue
    
    convenience init(pasteboard: Pasteboard) {
        self.init()
        text = pasteboard.text
        url = pasteboard.url
        image = pasteboard.image
        type = pasteboard.type.rawValue
    }
    
    func toStruct() -> Pasteboard {
        var pasteboard = Pasteboard()
        pasteboard.text = text
        pasteboard.url = url
        pasteboard.image = image
        pasteboard.type = GenreType(rawValue: type) ?? .none
        return pasteboard
    }
}

struct Pasteboard {
    var text = ""
    var url = ""
    var image = UIImage()
    var type = GenreType.none
}
