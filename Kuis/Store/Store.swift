//
//  Store.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation

protocol Store {
    associatedtype Entity
    func fetch() throws -> [Entity]
}
