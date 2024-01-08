    //
    //  SceneDelegate.swift
    //  Hotel
    //
    //  Created by Радмир Тельман on 07.01.2024.
    //

    import UIKit

    class SceneDelegate: UIResponder, UIWindowSceneDelegate {

        var window: UIWindow?
        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }

            let navigationController = UINavigationController(rootViewController: MainViewController())
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
