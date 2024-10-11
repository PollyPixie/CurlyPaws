//
//  DogDataManager.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import Foundation

class DogDataManager {
    
    private var dogs: [DogModel] = []
    private var currentIndex = 0
    
    init(dogs: [DogModel]) {
        self.dogs = dogs
    }
    
    func getCurrentDog() -> DogModel {
        dogs[currentIndex]
    }
    
    func getLastDog() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
    
    func getNextDog() {
        if currentIndex < dogs.count - 1 {
            currentIndex += 1
        }
    }
    
    func getFirstDog() {
        currentIndex = 0
    }
}

