#import "SimpleTableController.h"
#import "SimpleCell.h"

@implementation SimpleTableController
@synthesize somethingHappened;

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

        // shorthand for creatign memoized rows
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
                if (controller.somethingHappened) {
                    [controller registerUser];
                }
            };
        }
    }
}

- (void)registerUser {
    NSString *username = [[(SimpleCell *)[self memoizedCell:@"username"] textField] text];
    [self showAlert:[NSString stringWithFormat:@"Register as %@", username]];
}

- (void)showAlert:(NSString *)message {
    [[[UIAlertView alloc] initWithTitle:@"Controller"
                                message:message
                               delegate:self
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}
@end
