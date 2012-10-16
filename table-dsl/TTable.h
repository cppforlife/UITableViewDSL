@class TSection, TRow;

@interface TTable : NSObject
@property (nonatomic, retain) NSMutableArray *sections;

- (TSection *)blankSection;
- (NSInteger)numberOfSections;
- (TSection *)sectionAtIndex:(NSInteger)index;

- (TRow *)memoizedRowWithIdentifier:(NSString *)identifier;
@end
