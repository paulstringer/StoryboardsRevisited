import UIKit

// TODO: Protocol Orientate This So It Can Be Factored Out and Made More General

open class StoryboardViewController: UIViewController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler!
  
  override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}

open class StoryboardNavigationController: UINavigationController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler! {
    
    didSet {
      
      guard var controller = self.topViewController as? StoryboardManagedScene else { return }
      
      controller.storyboardSegueHandler = storyboardSegueHandler
      
    }
    
  }
  
  override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}

open class StoryboardTableViewController: UITableViewController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler!
  
  override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}

