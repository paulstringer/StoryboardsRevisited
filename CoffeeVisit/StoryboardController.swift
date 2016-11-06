import UIKit

// TODO: Protocol Orientate This So It Can Be Factored Out and Made More General

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
  
  private func dispatchVisitorToDestination() {
    guard let destination = segue.destination as? StoryboardVisitableScene else { return }
    destination.accept(visitor: self)
  }
  
  private func setSegueHandlerOnDestination() {
    guard var destination = segue.destination as? StoryboardManagedScene else { return }
    destination.storyboardSegueHandler = StoryboardSegueHandler()
  }
  
}

public protocol StoryboardSceneVisitor {
  
  var segue: UIStoryboardSegue { get }
  var sender: Any? { get }
  
  // This Protocol Provides the Client an Extension Point for Extending With Operations To Visit Each Scene
  
}

