//
//  PasteboardModel.swift
//  CopyPasteKeyboard
//
//  Created by Toshiki Chiba on 2017/03/26.
//  Copyright © 2017年 Toshiki Chiba. All rights reserved.
//

import Foundation
import RealmSwift

final class PasteboardModel {
    
    func loadAllPasteboard() -> [Pasteboard] {
        return loadAllResults().map { $0.toStruct() }
    }

    func loadPasteboard(type: GenreType) -> [Pasteboard] {
        return loadResults(type: type).map { $0.toStruct() }
    }

    func insertPasteboard(_ pasteboard: Pasteboard) {
        delete(id: pasteboard.id)
        do {
            let object = PasteboardEntity(pasteboard: pasteboard)
            let realm = try! Realm()
            try realm.write {
                realm.add(object)
            }
        } catch _ as NSError {}
    }

    func deletePasteboard(_ pasteboard: Pasteboard) {
        delete(id: pasteboard.id)
    }
    
    private func loadAllResults() -> Results<PasteboardEntity> {
        return try! Realm().objects(PasteboardEntity.self)
    }
    
    private func loadResults(type: GenreType) -> Results<PasteboardEntity> {
        let predicate = NSPredicate(format: "type = %d", type.rawValue)
        return loadAllResults().filter(predicate).sorted(byKeyPath: "createdAt", ascending: false)
    }
    
    private func delete(id: String) {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "id = %@", id)
        do {
            try realm.write {
                let deleteObjects = realm.objects(PasteboardEntity.self).filter(predicate)
                realm.delete(deleteObjects)
            }
        } catch _ as NSError {}
    }
}
