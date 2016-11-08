import UIKit

protocol ChooseSizeViewControllerDelegate {
  
  func chooseSizeViewController(_ viewController:ChooseSizeViewController,  didChoose cupSize: CupSizeIdentifier)
  
}

class ChooseSizeViewController: StoryboardTableViewController, ChooseSizeView {
  
  var presenter: ChooseSizePresenter?
  var items = [ChooseSizeViewItem]()
  var delegate: ChooseSizeViewControllerDelegate?
  
  override func viewWillDisappear(_ animated: Bool) {
    sendUpdates()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    presenter?.update()
  }
  
  func updateView(model: ChooseSizeViewModel) {
    items = model.items
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
  
  private func sendUpdates() {
    if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
      let selectedItem = items[selectedIndexPath.row]
      delegate?.chooseSizeViewController(self, didChoose: selectedItem.identifier)
    }
  }
  
}
