//
//  DogDataManager.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import Foundation

protocol DogDataManageable {
    var dogs: [DogModel] { get }
    var currentIndex: Int { get set }
    
    func getCurrentDog() -> DogModel
    func getLastDog()
    func getNextDog()
    func getFirstDog()
}

class DogDataManager: DogDataManageable {
    
    var dogs: [DogModel] = []
    var currentIndex = 0
    
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

