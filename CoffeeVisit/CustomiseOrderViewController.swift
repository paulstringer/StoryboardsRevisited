import UIKit

class CustomiseOrderViewController: StoryboardTableViewController, CustomiseOrderSummaryView {
  
  var interactor: CustomiseOrderSummaryInteractor?
  
  override func viewWillAppear(_ animated: Bool) {
    interactor?.update()
  }
  
  @IBAction func unwindToCustomiseOrder(unwindSegue: UIStoryboardSegue) {
    
    /*
     Empty. Exists solely so that view controllers can find instances
     of this class to unwind to.
     */
    
  }

  func updateView(model: CustomiseOrderSummaryViewModel) {
    tableView.reloadData()
    updateCupsizeTableCellDetailText(cupsize: model.cupSizeDetail)
    deselectSelectedRow()
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
