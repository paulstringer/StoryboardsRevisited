import Foundation

struct CustomiseOrderSummaryViewModel {
  let cupSizeDetail: String
}

protocol CustomiseOrderSummaryView {
  var interactor: CustomiseOrderSummaryInteractor? { get set }
  func updateView(model: CustomiseOrderSummaryViewModel)
}

struct CustomiseOrderSummaryInteractor {
  var view: CustomiseOrderSummaryView
  var context: CoffeeOrderContext
  
  func update() {
    let order = context.order
    let model = CustomiseOrderSummaryViewModel(cupSizeDetail: order.cupSize.name)
    view.updateView(model: model)
  }
  
}

