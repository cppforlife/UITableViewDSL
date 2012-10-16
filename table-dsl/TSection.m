#import "TSection.h"
#import "TRow.h"

@implementation TSection
@synthesize header = _header, footer = _footer, rows = _rows;

- (id)init {
    if (self = [super init]) {
        self.rows = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    self.header = nil;
    self.footer = nil;
    self.rows = nil;
    [super dealloc];
}

- (TRow *)blankRow {
    TRow *row = [[[TRow alloc] init] autorelease];
    [self.rows addObject:row];
    return row;
}

- (NSInteger)numberOfRows {
    return self.rows.count;
}

- (TRow *)rowAtIndex:(NSInteger)index {
    return [self.rows objectAtIndex:index];
}

- (TRow *)memoizedRowWithIdentifier:(NSString *)identifier {
    for (TRow *row in self.rows) {
        if (row.isMemoized && [row.identifier isEqualToString:identifier])
            return row;
    }
    return nil;
}
@end
