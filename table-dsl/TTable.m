#import "TTable.h"
#import "TSection.h"
#import "TRow.h"

@implementation TTable
- (id)init {
    if (self = [super init]) {
        sections_ = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    [sections_ release];
    [super dealloc];
}

- (TSection *)blankSection {
    TSection *section = [[[TSection alloc] init] autorelease];
    [sections_ addObject:section];
    return section;
}

- (NSInteger)numberOfSections {
    return sections_.count;
}

- (TSection *)sectionAtIndex:(NSInteger)index {
    return [sections_ objectAtIndex:index];
}

- (TRow *)memoizedRowWithIdentifier:(NSString *)identifier {
    TRow *memoizedRow = nil;
    for (TSection *section in sections_) {
        if ((memoizedRow = [section memoizedRowWithIdentifier:identifier])) break;
    }
    return memoizedRow;
}
@end