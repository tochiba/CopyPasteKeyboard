//
//  PasteboardService.swift
//  CopyPasteKeyboard
//
//  Created by Toshiki Chiba on 2017/03/26.
//  Copyright © 2017年 Toshiki Chiba. All rights reserved.
//

import Foundation
import UIKit

final class PasteboardService {
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(updatePasteboard), name: NSNotification.Name.UIPasteboardChanged, object: nil)
    }
 
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    dynamic private func updatePasteboard() {
        print(UIPasteboard.general.strings ?? "")
    }
}
