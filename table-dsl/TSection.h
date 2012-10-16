@class TRow;

@interface TSection : NSObject
@property (nonatomic, copy) NSString *header, *footer;
@property (nonatomic, retain) NSMutableArray *rows;

- (TRow *)blankRow;
- (NSInteger)numberOfRows;
- (TRow *)rowAtIndex:(NSInteger)index;

- (TRow *)memoizedRowWithIdentifier:(NSString *)identifier;
@end
