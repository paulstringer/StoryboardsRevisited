import UIKit

class CustomiseOrderViewController: StoryboardTableViewController, CustomiseOrderSummaryView {
  
  var presenter: CustomiseOrderSummaryPresenter?
  
  override func viewWillAppear(_ animated: Bool) {
    presenter?.update()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    deselectSelectedRow()
  }
  
  func updateView(model: CustomiseOrderSummaryViewModel) {
    
    print("Update the detail of the cupsize")
    
    updateCupsizeTableCellDetailText(cupsize: model.cupSizeDetail)
    
  }
  
  func deselectSelectedRow() {
    
    if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: selectedIndexPath, animated: true)
    }
    
  }
  func updateCupsizeTableCellDetailText(cupsize: String) {
    
    let indexPathOfCupSizeRow = IndexPath(row: 1, section: 0)
    
    let cupsizeCell = self.tableView.cellForRow(at: indexPathOfCupSizeRow)
    
    cupsizeCell?.detailTextLabel?.text = cupsize
    
    
  }
  
}
