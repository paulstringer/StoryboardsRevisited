import UIKit

class ChooseBeverageViewController: StoryboardTableViewController, OrderDataSource {
  
  
  var order: Order {
    
    get {
     
      guard let selectedTitle = titleForSelectedRow() else {
        return Order()
      }
      
      return Order(name: selectedTitle)
      
    }
  }
  
  private func titleForSelectedRow() -> String? {
    
    guard let selectedIndexPath = self.tableView.indexPathForSelectedRow else {
      return nil
    }
    
    guard let selectedText = self.tableView.cellForRow(at: selectedIndexPath)?.textLabel?.text else {
      return nil
    }
    
    return selectedText
    
  }
  
}
