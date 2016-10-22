import UIKit

class ViewController2: UIViewController {
  
  var dataSource: ViewController2DataSource!
  
  override func viewWillAppear(_ animated: Bool) {
    print(dataSource.value)
  }

}
