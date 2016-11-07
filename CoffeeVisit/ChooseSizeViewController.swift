import UIKit

protocol ChooseSizeViewControllerDelegate {
  
  func chooseSizeViewController(_ viewController:ChooseSizeViewController,  didChoose cupSize: CupSize)
  
}

class ChooseSizeViewController: StoryboardTableViewController {
  
  var selectedCupSize: CupSize = .Medium
  var delegate: ChooseSizeViewControllerDelegate?
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    selectedCupSize = cupSizeForIndexPath(indexPath)
    delegate?.chooseSizeViewController(self, didChoose: selectedCupSize)
    
  }
  
  func cupSizeForIndexPath(_ indexPath: IndexPath) -> CupSize {
    
    switch indexPath.row {
    case 0:
      return .Small
    case 1:
        return .Medium
    case 2:
      return .Large
    default:
      return .Medium
    }
    
  }

  
}
