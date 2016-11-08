import UIKit

protocol ChooseBeverageViewControllerDelegate {
  
  func chooseBeverageViewController(_ viewController:ChooseBeverageViewController,  didChoose drink: Drink)
  
}

class ChooseBeverageViewController: StoryboardTableViewController {
  
  var delegate: ChooseBeverageViewControllerDelegate?
  
  private func titleForSelectedRow() -> String? {
    
    guard let selectedIndexPath = self.tableView.indexPathForSelectedRow else {
      return nil
    }
    
   return self.tableView.cellForRow(at: selectedIndexPath)!.textLabel!.text
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    delegate?.chooseBeverageViewController(self,  didChoose: drinkForSelectedRow())
    
  }
  
  private func drinkForSelectedRow() -> Drink {
    
//    guard let drinkName = titleForSelectedRow() else { return .Drip }
    
    return Drink(rawValue: "D")!
    
  }
  
}
