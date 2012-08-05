#import "TDSL.h"

@class TTable;

@interface TTableController : UITableViewController
@property (nonatomic, retain) TTable *table;

- (UITableViewCell *)memoizedCell:(NSString *)identifier;
@end
