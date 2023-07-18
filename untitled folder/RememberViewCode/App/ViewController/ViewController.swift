import UIKit

class ViewController: UIViewController {
    
    private let customView: ViewControllerViewProtocol
    private let interactor: ViewControllerInteractorProtocol
    
    init(customView: ViewControllerViewProtocol,
         interactor: ViewControllerInteractorProtocol)
    {
        self.customView = customView
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.viewDidLoad(viewController: self)
    }
}

extension ViewController: ViewControllerPresenterDelegate {
    func renderContent()
    {
        
    }
}
