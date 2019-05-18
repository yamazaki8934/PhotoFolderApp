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

struct Person: Decodable {
    let name: String
}
