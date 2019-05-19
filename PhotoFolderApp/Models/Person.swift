//
//  Person.swift
//  PhotoFolderApp
//
//  Created by 山崎浩毅 on 2019/05/18.
//  Copyright © 2019 山崎浩毅. All rights reserved.
//

import Foundation

struct PersonResponse: Decodable {
    let people: [Person]
}

extension PersonResponse: Decodable {
    init(from decoder: Decoder) throws {
        var people: [Person] = []
        var unkeyedContainer = try decoder.unkeyedContainer()
        while !unkeyedContainer.isAtEnd {
            let person = try unkeyedContainer.decode(Person.self)
            people.append(person)
        }
        self.init(users: people)
    }
}

struct Person: Decodable {
    let name: String
}
