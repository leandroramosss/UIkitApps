import UIKit

Protocol ViewControllerDataStoreProtocol: AnyObject {
    //TODO: Values that i want to store ex:
     var isCheckboxSelected: Bool { get set }
}

final class ViewControllerDataStore: ViewControllerDataStoreProtocol {
    
}
