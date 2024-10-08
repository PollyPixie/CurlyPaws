//
//  DogManager.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import Foundation

class DogManager {
    
    func getDogs() -> [DogModel] {
        return [
        DogModel(
            imageName: "toyPoodle",
            description: "Toy Poodle is a small, intelligent, and lively breed. Typically weighs between 2 to 4 kg . Known for being affectionate and highly trainable."),
        DogModel(
            imageName: "bichonFrise",
            description: "Bichon Frise is a small, cheerful breed with a fluffy white coat. Weighs around 4 to 8 kg pounds. Friendly, playful, and great with families."),
        DogModel(
            imageName: "cavapoo",
            description: "Cavapoo is a hybrid breed, a mix of Cavalier King Charles Spaniel and Poodle. Weighs between 5 to 10 kg. Known for being affectionate, intelligent, and great with kids."),
        DogModel(
            imageName: "labradoodle",
            description: "Labradoodle is a hybrid breed, a mix of Labrador Retriever and Poodle. Typically weighs between 22 to 30 kg. Known for being friendly, energetic, and highly social.")
        ]
    }
}
