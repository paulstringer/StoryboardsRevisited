import UIKit

protocol ChooseBeverageViewControllerDelegate {
  
  func chooseBeverageViewController(_ viewController:ChooseBeverageViewController,  didChoose drink: DrinkIdentifier)
  
}

class ChooseBeverageViewController: StoryboardTableViewController, ChooseBeverageView {
  
  var interactor: ChooseBeverageInteractor?
  var delegate: ChooseBeverageViewControllerDelegate?
  var items = [ChooseBeverageViewItem]()
  
  
  override func viewWillAppear(_ animated: Bool) {
    interactor?.update()
  }
  
  func updateView(model: ChooseBeverageViewModel) {
    items = model.items
    tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")!
    cell.textLabel?.text = item.name
    return cell
  }
  
  private func titleForSelectedRow() -> String? {
    guard let selectedIndexPath = self.tableView.indexPathForSelectedRow else {
      return nil
    }
    return self.tableView.cellForRow(at: selectedIndexPath)!.textLabel!.text
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let identifier = items[indexPath.row].identifier
    delegate?.chooseBeverageViewController(self,  didChoose: identifier)
    
  }

  
}
