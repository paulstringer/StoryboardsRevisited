import UIKit

class StoryboardViewController: UIViewController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler!
  
  override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}

class StoryboardNavigationController: UINavigationController, StoryboardManagedScene {
  
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

class StoryboardTableViewController: UITableViewController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler!
  
  override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}

