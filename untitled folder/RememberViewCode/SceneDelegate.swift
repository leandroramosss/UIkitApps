import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let viewController = ViewControllerInitializer.Initializer.createScene()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene)
    {
        //TODO: empty
    }

    func sceneDidBecomeActive(_ scene: UIScene)
    {
        //TODO: empty
    }

    func sceneWillResignActive(_ scene: UIScene)
    {
        //TODO: empty
    }

    func sceneWillEnterForeground(_ scene: UIScene)
    {
        //TODO: empty
    }

    func sceneDidEnterBackground(_ scene: UIScene)
    {
        //TODO: empty
    }
}
