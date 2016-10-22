import UIKit

class ViewController1: UIViewController {
  
  var dataSource: ViewController1DataSource!
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    switch segue.identifier! {
    case "ShowNext":
      let destination = segue.destination as! ViewController2
      destination.dataSource = ViewController2DataSource(value: "ViewController1 -> ViewController2")
    case "ShowShared":
      let destination = segue.destination as! SharedViewController
      destination.dataSource = SharedViewControllerDataSource(value: "ViewController1 -> SharedViewController")  
    default:
      return
    }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    print(dataSource.value)
  }

}

