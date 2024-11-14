//
//  DogModel.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import Foundation

struct DogModel {
    let imageName: String
    let dogDescription: String
    var isMark = false
}

// MARK: - Comparable
extension DogModel: Comparable {
    static func < (lhs: DogModel, rhs: DogModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}

// MARK: - CustomStringConvertible
extension DogModel: CustomStringConvertible {
    var description: String {
        "\(dogDescription)"
    }
}
