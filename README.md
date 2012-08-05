## Custom DSL for creating semi-static UITableViews

Build the project to see SimpleTableController use table DSL. 
Or just copy files under Group T into your project to start using it yourself.

```objc
#import "TTableController.h"

@interface SimpleTableController < TTableController
@end

@implementation SimpleTableController

defineTable
    addSection {
        header = @"Welcome";

        addRow {
            row.memoize = YES;
            identifier = @"username";
            className = @"SimpleCell";
            text = @"Username";
            customize = ^(SimpleCell *cell){
                cell.textField.placeholder = @"required";
            };
        }

        addMemoizedRow(@"password", @"SimpleCell") {
            text = @"Password";
            customize = ^(SimpleCell *cell){
                cell.textField.placeholder = @"required";
            };
        }

        addMemoizedRow(@"confirm-password", @"SimpleCell") {
            text = @"Confirm";
            customize = ^(SimpleCell *cell){
                cell.textField.placeholder = @"required";
            };
        }
    }

    addSection {
        footer = @"We will not share your email with anyone.";

        addRow {
            identifier = @"register";
            text = @"Register";
            
            build = ^{
                return [[[UITableViewCell alloc]
                         initWithStyle:UITableViewCellStyleDefault
                         reuseIdentifier:row.identifier] autorelease];
            };
            
            customize = ^(UITableViewCell *cell){
                cell.textLabel.textAlignment = UITextAlignmentCenter;
            };
            
            onTap = ^{
                [controller registerUser];
            };
        }
    }
}

@end
```

* `TTableController` subclasses UITableViewController
* `controller` object is available inside defineTable
  * do not use `self` in blocks in place of `controller` since that would result in a retain cycle
* `section` object is available inside addSection
* `row` object is available inside addRow/addMemoizedRow
* `build` block is called when cell is constructed (so only once)
* `customize` block is called when cell was just dequeued or built 
* `onTap` is self explanatory
* you can access memoized cell (by identifier) anywhere inside your controller class 
  after `viewDidLoad` and before `viewDidUnload`
  * `[[(SimpleCell *)[self memoizedCell:@"username"] textField] text]`
  
## Todos

* figure out how to add missing opening curly brace for defineTable