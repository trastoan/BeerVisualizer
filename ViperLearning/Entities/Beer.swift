//
//  Beer.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
import RealmSwift

final class Beer: Object, Decodable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var tagline: String?
    @objc dynamic var details: String?
    @objc dynamic var imageURL: String?
    @objc dynamic var shouldBeDeleted: Bool = false
    
    //Change keys that are different on the response
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
    
    //Change key to should be deleted, and only deletes when app terminates
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
    
    //Batch delete all records that have the shoulBeDeleted to true
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
    //Fetch all valid favorites from DB
    static func all() -> [Beer]? {
        do {
            let realm = try Realm()
            return Array(realm.objects(self).filter("shouldBeDeleted = false"))
        } catch {
            return nil
        }
    }
    //Find beer by id
    static func find(with id: Int) -> Beer? {
        do {
            let realm = try Realm()
            return realm.object(ofType: self, forPrimaryKey: id)
        } catch {
            return nil
        }
    }
}
