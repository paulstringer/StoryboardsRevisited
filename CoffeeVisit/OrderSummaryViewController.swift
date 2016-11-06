import UIKit

class OrderSummaryViewController: StoryboardViewController {
  
  var model: OrderSummaryViewModel!
  
  @IBOutlet weak var label: UILabel!
  
  override func viewWillAppear(_ animated: Bool) {
    label.text = model.name
  }
  
}
