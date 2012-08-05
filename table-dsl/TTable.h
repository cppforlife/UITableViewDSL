@class TSection, TRow;

@interface TTable : NSObject {
    NSMutableArray *sections_;
}
- (TSection *)blankSection;
- (NSInteger)numberOfSections;
- (TSection *)sectionAtIndex:(NSInteger)index;

- (TRow *)memoizedRowWithIdentifier:(NSString *)identifier;
@end