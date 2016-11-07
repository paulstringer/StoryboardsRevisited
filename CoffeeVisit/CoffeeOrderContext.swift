
import Foundation

class CoffeeOrderContext: ChooseSizeViewControllerDelegate, ChooseBeverageViewControllerDelegate {

  var order =  Order()
  
  internal func chooseSizeViewController(_ viewController: ChooseSizeViewController, didChoose size: CupSize) {
    
    order.cupSize = size
    
    _ = viewController.navigationController?.popViewController(animated: true)
    
  }

  internal func chooseBeverageViewController(_ viewController: ChooseBeverageViewController, didChoose drink: Drink) {
    
    order.drink = drink
    
    viewController.performSegue(withIdentifier: "ShowNext", sender: nil)
    
  }

  
  
  
}
