import UIKit

//TODO: Refactor to remove repetition

class StoryboardViewController: UIViewController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler!
  
  override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    storyboardSegueHandler.prepare(for: segue, sender: sender)
    
  }
  
}

class StoryboardNavigationController: UINavigationController, StoryboardManagedScene {
  
  public var storyboardSegueHandler: StoryboardSegueHandler! {
    
    didSet {
      
      let segue = UIStoryboardSegue(identifier: nil, source: self, destination: self.topViewController!)
      
      storyboardSegueHandler.prepare(for: segue, sender: nil)
      
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

