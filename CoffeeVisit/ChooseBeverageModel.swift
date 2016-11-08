import Foundation

struct ChooseBeverageViewItem {
  let name: String
  let identifier: DrinkIdentifier
}

struct ChooseBeverageViewModel {
  let items: [ChooseBeverageViewItem]
}

protocol ChooseBeverageView {
  var interactor: ChooseBeverageInteractor? { get set }
  func updateView(model: ChooseBeverageViewModel)
}

struct ChooseBeverageInteractor {
  
  var view: ChooseBeverageView
  
  func update() {
    let model  = ChooseBeverageViewModel(items: DrinkEntityGateway.fetchAll.map { (entity) -> ChooseBeverageViewItem in
      return ChooseBeverageViewItem(name: entity.name, identifier: entity.identifier)
    })
    view.updateView(model: model)
  }
}
