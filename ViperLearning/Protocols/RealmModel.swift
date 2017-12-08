//
//  RealmModel.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation

protocol RealModel {
    func save() -> Error?
    func delete() -> Error?
    static func all() -> [Self]?
    func update() -> Error?
}
