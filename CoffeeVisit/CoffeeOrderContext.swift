
import Foundation

class CoffeeOrderContext: ChooseSizeViewControllerDelegate, ChooseBeverageViewControllerDelegate {

  var order =  Order()
  
  internal func chooseSizeViewController(_ viewController: ChooseSizeViewController, didChoose cupSize: CupSizeIdentifier) {
    
    order.cupSize = CupSizeEntity(identifier: cupSize)
    
  }

  internal func chooseBeverageViewController(_ viewController: ChooseBeverageViewController, didChoose drink: Drink) {
    
//    order.drink = drink
    
    viewController.performSegue(withIdentifier: "ShowNext", sender: nil)
    
  }

  
  
  
}
