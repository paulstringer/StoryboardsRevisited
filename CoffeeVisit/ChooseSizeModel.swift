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
  var presenter: ChooseSizePresenter? { get set }
  func updateView(model: ChooseSizeViewModel)
}

struct ChooseSizePresenter {
  
  var view: ChooseSizeView
  
  func update() {
    let model = ChooseSizeViewModel(items: CupSizeEntityGateway.fetchAllCupSizes.map { (entity) -> ChooseSizeViewItem in
      return ChooseSizeViewItem(name: entity.name, identifier: entity.identifier)
    })
    view.updateView(model: model)
  }
}

