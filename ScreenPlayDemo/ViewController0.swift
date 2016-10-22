import UIKit

class ViewController0: UIViewController {
  
  var dataSource: ViewController0DataSource!
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    switch segue.identifier! {
      
    case "ShowNext":
      
      let destination = segue.destination as! ViewController1
      destination.dataSource = ViewController1DataSource(sharedDataSource: dataSource.sharedDataSource)
      
    case "ShowShared":
      
      let destination = segue.destination as! SharedViewController
      destination.dataSource = dataSource.sharedDataSource
      
    default:
      return
      
    }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    print(dataSource.sharedDataSource.value)
    
  }

}

