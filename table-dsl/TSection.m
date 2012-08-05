#import "TSection.h"
#import "TRow.h"

@implementation TSection
@synthesize header, footer;

- (id)init {
    if (self = [super init]) {
        rows_ = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    self.header = nil;
    self.footer = nil;
    [rows_ release];
    [super dealloc];
}

- (TRow *)blankRow {
    TRow *row = [[[TRow alloc] init] autorelease];
    [rows_ addObject:row];
    return row;
}

- (NSInteger)numberOfRows {
    return rows_.count;
}

- (TRow *)rowAtIndex:(NSInteger)index {
    return [rows_ objectAtIndex:index];
}

- (TRow *)memoizedRowWithIdentifier:(NSString *)identifier {
    for (TRow *row in rows_) {
        if (row.isMemoized && [row.identifier isEqualToString:identifier])
            return row;
    }
    return nil;
}
@end
