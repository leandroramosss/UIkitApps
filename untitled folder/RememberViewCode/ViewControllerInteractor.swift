import UIKit

protocol ViewControllerInteractorProtocol {
    func viewDidLoad(viewController: UIViewController)
}

final class ViewControllerInteractor: ViewControllerInteractorProtocol {
    
    private var keyboardDismissManager: KeyboardManager?
        
    private let coordinator: ViewControllerCoordinatorProtocol
    private let dataStore: ViewControllerDataStoreProtocol
    private let presenter: ViewControllerPresenterProtocol
    
    init(coordinator: ViewControllerCoordinatorProtocol,
         dataStore: ViewControllerDataStoreProtocol,
         presenter: ViewControllerPresenterProtocol)
    {
        self.coordinator = coordinator
        self.dataStore = dataStore
        self.presenter = presenter
    }
    
    func viewDidLoad(viewController: UIViewController)
    {
        presenter.presentContent()
        keyboardDismissManager = KeyboardManager(viewController: viewController)
        keyboardDismissManager?.startMonitoring()
    }
}
