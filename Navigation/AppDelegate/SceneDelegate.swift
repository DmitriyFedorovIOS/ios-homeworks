//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Fedorov Dmitry on 04.04.2023.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
         lazy var feedNavigationController = FeedViewController()
         lazy var logInViewController =  LogInViewController()

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }

    func feedNavigationController() -> UINavigationController {
        let feedNavigationController = FeedViewController()
        feedNavigationController.title = "Лента"
        feedNavigationController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "list.dash"), tag: 0)

        return UINavigationController(rootViewController: feedNavigationController)

    }

    func logInViewController() -> UINavigationController {
        let logInViewController = LogInViewController()
        logInViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.crop.circle"), tag: 1)

        return UINavigationController(rootViewController: logInViewController)
    }

    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .white
        tabBarController.viewControllers = [feedNavigationController(), logInViewController()]

        return tabBarController
    }

}
