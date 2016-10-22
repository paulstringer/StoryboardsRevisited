import UIKit

class ViewController2: UIViewController {
  
  var dataSource: ViewController2DataSource!
  
  @IBOutlet weak var label: UILabel!
  
  override func viewWillAppear(_ animated: Bool) {
    
    label.text = dataSource.labelText
    
  }

}
