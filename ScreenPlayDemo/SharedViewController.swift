import UIKit

class SharedViewController: UIViewController {
  
  var dataSource: SharedViewControllerDataSource!
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier! {
    case "EmbedNext":
      let destination = segue.destination as! ViewController2
      destination.dataSource = ViewController2DataSource(labelText: dataSource.value)
    default:
      return
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    print(dataSource.value)
  }
 
  @IBAction func done(_ sender: AnyObject) {
    dismiss(animated: true, completion: nil)
  }
  
}
