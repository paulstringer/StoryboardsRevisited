import UIKit

class ViewController0: UIViewController {
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    switch segue.identifier! {
    case "ShowNext":
      let destination = segue.destination as! ViewController1
      destination.dataSource = ViewController1DataSource(value: "ViewController0 -> ViewController1")
    case "ShowShared":
      let destination = segue.destination as! SharedViewController
      destination.dataSource = SharedViewControllerDataSource(value: "ViewController0 -> SharedViewController")
    default:
      return
    }
    
  }

}

