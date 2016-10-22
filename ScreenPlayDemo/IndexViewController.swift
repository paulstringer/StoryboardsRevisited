import UIKit

class IndexViewController: UITableViewController {
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let destination = segue.destination as! ViewController0
    
    let sharedViewControllerDataSource = SharedViewControllerDataSource(value: "🦄")
    
    destination.dataSource = ViewController0DataSource(sharedDataSource: sharedViewControllerDataSource)
    
  }
  
}
