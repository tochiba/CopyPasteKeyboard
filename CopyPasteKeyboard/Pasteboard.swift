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

final class Pasteboard: Object {
    dynamic var text = ""
    dynamic var url = ""
    dynamic var image = UIImage()
    dynamic var type = 0
}
