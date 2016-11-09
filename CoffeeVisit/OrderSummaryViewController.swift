import UIKit

class OrderSummaryViewController: StoryboardViewController, OrderSummaryView {

  @IBOutlet weak var label: UILabel!
  
  var interactor: OrderSummaryInteractor?

  internal func updateView(model: OrderSummaryViewModel) {
    label.text = model.name
  }
  
  override func viewWillAppear(_ animated: Bool) {
    interactor?.update()
  }
  
}
