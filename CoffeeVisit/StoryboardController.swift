import UIKit

public struct StoryboardSegueHandler {
  
  public init() {}
  
  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let storyboardController = StoryboardController(segue: segue, sender: sender)
    storyboardController.prepare()
  }
  
}

public protocol StoryboardVisitableScene {
  func accept(visitor: StoryboardSceneVisitor)
}

public protocol StoryboardManagedScene {
  var storyboardSegueHandler: StoryboardSegueHandler! { get set }
}

struct StoryboardController: StoryboardSceneVisitor {
  
  let segue: UIStoryboardSegue
  let sender: Any?
  
  func prepare() {
    setSegueHandlerOnDestination()
    dispatchVisitorToDestination()
  }
  
  private func setSegueHandlerOnDestination() {
    guard var destination = segue.destination as? StoryboardManagedScene else { return }
    destination.storyboardSegueHandler = StoryboardSegueHandler()
  }
  
  private func dispatchVisitorToDestination() {
    guard let destination = segue.destination as? StoryboardVisitableScene else { return }
    destination.accept(visitor: self)
  }
  
}

public protocol StoryboardSceneVisitor {
  
  // methods that prepare each scene:
  
}

