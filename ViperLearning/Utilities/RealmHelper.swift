//
//  RealmHelper.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 08/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmHelper {
    static func realmConfiguration() {
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
        })
        Realm.Configuration.defaultConfiguration = config
        do {
            let _ = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
