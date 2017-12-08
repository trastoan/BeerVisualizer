//
//  Beer.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
import RealmSwift

final class Beer: Object, Decodable, NSCopying {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var tagline: String?
    @objc dynamic var details: String?
    @objc dynamic var imageURL: String?
    @objc dynamic var shouldBeDeleted: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case name
        case id
        case tagline
        case details = "description"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Beer()
        copy.id = self.id
        copy.name = self.name
        copy.tagline = self.tagline
        copy.details = self.details
        copy.imageURL = self.imageURL
        
        return copy
    }
}

//Realm interactions
extension Beer : RealModel {
    func save() -> Error? {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
            return nil
        } catch let error {
            return error
        }
    }
    
    func delete() -> Error? {
        do {
            let realm = try Realm()
            try realm.write {
                self.shouldBeDeleted = !self.shouldBeDeleted
                realm.add(self, update: true)
            }
            return nil
        } catch let error {
            return error
        }
    }
    
    static func batchDelete() -> Error? {
        do {
            let realm = try Realm()
            let objects = realm.objects(self).filter("shouldBeDeleted = true")
            try realm.write {
                realm.delete(objects)
            }
            return nil
        } catch let error {
            return error
        }
    }
    
    func update() -> Error? {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self, update: true)
            }
            return nil
        } catch let error {
            return error
        }
    }
    
    static func all() -> [Beer]? {
        do {
            let realm = try Realm()
            return Array(realm.objects(self).filter("shouldBeDeleted = false"))
        } catch {
            return nil
        }
    }
    
    static func find(with id: Int) -> Beer? {
        do {
            let realm = try Realm()
            return realm.object(ofType: self, forPrimaryKey: id)
        } catch {
            return nil
        }
    }
}
