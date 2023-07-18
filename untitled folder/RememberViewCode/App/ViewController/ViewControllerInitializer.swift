import Foundation
import UIKit

final class ViewControllerInitializer {
    
    enum Initializer {
        
        static func createScene() -> UIViewController
        {
            let coordinator = ViewControllerCoordinator()
            let dataStore = ViewControllerDataStore()
            let presenter = ViewControllerPresenter()
            let interactor = ViewControllerInteractor(coordinator: coordinator,
                                                      dataStore: dataStore,
                                                      presenter: presenter)
            
            let view = ViewControllerView.make()
            let viewController = ViewController(customView: view,
                                                interactor: interactor)
            presenter.setup(delegate: viewController)
            coordinator.setup(viewController: viewController)
            
            return viewController
        }
    }
}
