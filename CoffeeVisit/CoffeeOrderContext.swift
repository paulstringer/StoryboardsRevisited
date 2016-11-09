
import Foundation

class CoffeeOrderContext: ChooseSizeViewControllerDelegate, ChooseBeverageViewControllerDelegate {

  var order =  Order()
  
  internal func chooseSizeViewController(_ viewController: ChooseSizeViewController, didChoose cupSize: CupSizeIdentifier) {
    
    order.cupSize = CupSizeEntityGateway.fetchOne(for: cupSize)!
    
  }

  internal func chooseBeverageViewController(_ viewController: ChooseBeverageViewController, didChoose drink: DrinkIdentifier) {
    
    order.drink = DrinkEntityGateway.fetchOne(for: drink)!
    
  }
  
}
