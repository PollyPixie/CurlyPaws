//
//  SceneDelegate.swift
//  CurlyPaws
//
//  Created by Полина Соколова on 08.10.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let dogDataManager = createDogDataManager()
        
        
        let imageListViewController = ImageListViewController()
        imageListViewController.dogDataManager = dogDataManager
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = imageListViewController
        window?.makeKeyAndVisible()
    }
    
    
    private func createDogDataManager() -> IDogDataManageable {
        let dogManager = DogManager()
        let dogs = dogManager.getDogs().sorted(by: <)
        let dogDataManager: IDogDataManageable = DogDataManager(dogs: dogs)
        return dogDataManager
    }
    
    private func printDogsInfo(dogs: [DogModel]) {
        for dog in dogs {
            print(dog.description)
        }
    }
}

