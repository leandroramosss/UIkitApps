import UIKit

protocol ViewControllerCoordinatorProtocol {
    func setup(viewController: UIViewController?)
}

final class ViewControllerCoordinator: ViewControllerCoordinatorProtocol {
    
    weak var rootViewController: UIViewController?
        
    func setup(viewController: UIViewController?)
    {
        rootViewController = viewController
    }
}
