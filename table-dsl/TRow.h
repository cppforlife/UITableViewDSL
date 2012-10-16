@interface TRow : NSObject
@property (nonatomic, copy) NSString *className, *identifier, *text, *detail;
@property (nonatomic, copy) id build, customize, onTap;

@property (nonatomic, assign, getter=isMemoized) BOOL memoize;
@property (nonatomic, retain) UITableViewCell *memoizedCell;

- (UITableViewCell *)buildForTableView:(UITableView *)tableView;
- (void)tap;
@end
