//
//  DogModel.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import Foundation

struct DogModel: Comparable, CustomStringConvertible {
    let imageName: String
    let dogDescription: String
    
    var description: String {
            "Название картинки: \(imageName), описание: \(dogDescription)"
        }

    static func < (lhs: DogModel, rhs: DogModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}
