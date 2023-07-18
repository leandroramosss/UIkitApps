import UIKit

final class KeyboardManager {
    
    private weak var viewController: UIViewController?
    private weak var tapGestureRecognizer: UITapGestureRecognizer?
    
    init(viewController: UIViewController)
    {
        self.viewController = viewController
    }
    
    func startMonitoring()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(handleTap))
        self.tapGestureRecognizer = tapGestureRecognizer
        
        viewController?.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func handleTap()
    {
        viewController?.view.endEditing(true)
    }
    
    func stopMonitoring()
    {
        if let tapGestureRecognizer = tapGestureRecognizer {
            viewController?.view.undoManager?.removeAllActions(withTarget: tapGestureRecognizer)
            self.tapGestureRecognizer = nil
        }
    }
}
