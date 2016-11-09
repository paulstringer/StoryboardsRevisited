import Foundation

struct ChooseSizeViewItem {
  let name: String
  let identifier: CupSizeIdentifier
  let selected = false
}

struct ChooseSizeViewModel {
  let items: [ChooseSizeViewItem]
}

protocol ChooseSizeView {
  var interactor: ChooseSizeInteractor? { get set }
  func updateView(model: ChooseSizeViewModel)
}

struct ChooseSizeInteractor {
  
  var view: ChooseSizeView
  
  func update() {
    let model = ChooseSizeViewModel(items: CupSizeEntityGateway.fetchAll.map { (entity) -> ChooseSizeViewItem in
      return ChooseSizeViewItem(name: entity.name, identifier: entity.identifier)
    })
    view.updateView(model: model)
  }
}

