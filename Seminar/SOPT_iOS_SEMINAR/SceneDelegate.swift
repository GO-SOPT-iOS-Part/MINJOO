//
//  SceneDelegate.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/04/07.
//


import UIKit
import Inject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
            window?.rootViewController = UINavigationController(rootViewController: MainPage_Home())
            window?.makeKeyAndVisible()
    }
}
