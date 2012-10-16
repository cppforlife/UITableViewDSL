#import "TTable.h"
#import "TSection.h"
#import "TRow.h"

@implementation TTable
@synthesize sections = _sections;

- (id)init {
    if (self = [super init]) {
        self.sections = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    self.sections = nil;
    [super dealloc];
}

- (TSection *)blankSection {
    TSection *section = [[[TSection alloc] init] autorelease];
    [self.sections addObject:section];
    return section;
}

- (NSInteger)numberOfSections {
    return self.sections.count;
}

- (TSection *)sectionAtIndex:(NSInteger)index {
    return [self.sections objectAtIndex:index];
}

- (TRow *)memoizedRowWithIdentifier:(NSString *)identifier {
    TRow *memoizedRow = nil;
    for (TSection *section in self.sections) {
        if ((memoizedRow = [section memoizedRowWithIdentifier:identifier])) break;
    }
    return memoizedRow;
}
@end
