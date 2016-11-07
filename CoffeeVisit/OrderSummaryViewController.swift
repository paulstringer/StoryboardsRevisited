import UIKit

class OrderSummaryViewController: StoryboardViewController, OrderSummaryView {

  @IBOutlet weak var label: UILabel!
  
  var presenter: OrderSummaryPresenter?

  internal func updateView(model: OrderSummaryViewModel) {
    label.text = model.name
  }
  
  override func viewWillAppear(_ animated: Bool) {
    presenter?.update()
  }
  
}
