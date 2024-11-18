//
//  DogDataManager.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import Foundation

protocol IDogDataManageable {
    var dogs: [DogModel] { get set }
    var currentIndex: Int { get set }
    
    func getCurrentDog() -> DogModel
    func getLastDog()
    func getNextDog()
    func getFirstDog()
    func findImage(by name: String) -> DogModel?
    func toggleMark(at index: Int)
    func getMarkedDogs() -> [DogModel]
    func toggleMarkForDog(_ dog: DogModel)
}

class DogDataManager { 
    var dogs: [DogModel] = []
    var currentIndex = 0
    
    init(dogs: [DogModel]) {
        self.dogs = dogs
    }
    
    func findImage(by name: String) -> DogModel? {
        for dog in dogs {
            if dog.imageName == name {
                return dog
            }
        }
        return nil
    }
}

// MARK: - DogProvidable
extension DogDataManager: IDogDataManageable {
    
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
    
    func toggleMark(at index: Int) {
        dogs[index].isMark.toggle()
    }
    
    func getMarkedDogs() -> [DogModel] {
        var isMarkedDogs = [DogModel]()
        for dog in dogs {
            if dog.isMark {
                isMarkedDogs.append(dog)
            }
        }
        return isMarkedDogs
    }
    
    func toggleMarkForDog(_ dog: DogModel) {
        if let index = dogs.firstIndex(of: dog) {
            dogs[index].isMark.toggle()
        }
    }
}

