@class TRow;

@interface TSection : NSObject {
    NSMutableArray *rows_;
}
@property (nonatomic, copy) NSString *header, *footer;

- (TRow *)blankRow;
- (NSInteger)numberOfRows;
- (TRow *)rowAtIndex:(NSInteger)index;

- (TRow *)memoizedRowWithIdentifier:(NSString *)identifier;
@end