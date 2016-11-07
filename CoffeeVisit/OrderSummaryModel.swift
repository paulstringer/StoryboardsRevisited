import Foundation

struct OrderSummaryViewModel {
  
  let name: String
  let cupSize: CupSize
  
}

protocol OrderSummaryView {
  
  var presenter: OrderSummaryPresenter? { get set }
  func updateView(model: OrderSummaryViewModel)
  
}

struct OrderSummaryPresenter {
  
  var view: OrderSummaryView
  var context: CoffeeOrderContext
  
  func update() {
    let order = context.order
    let model = OrderSummaryViewModel(name: order.name, cupSize: order.cupSize)
    view.updateView(model: model)
  }
}
