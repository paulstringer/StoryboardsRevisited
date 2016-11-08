import Foundation

struct OrderSummaryViewModel {
  
  let name: String
  let cupSize: String
  
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
    let model = OrderSummaryViewModel(name: order.drink.rawValue, cupSize: order.cupSize.rawValue)
    view.updateView(model: model)
  }
}
