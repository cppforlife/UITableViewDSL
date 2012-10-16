#import "TTableController.h"
#import "TTable.h"
#import "TSection.h"
#import "TRow.h"

@implementation TTableController
@synthesize table = _table;

- (void)setUpTable {
    NSAssert(NO, @"Subclasses must overwrite this method either manually or with the help of TDSL.h");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTable];
}

- (void)viewDidUnload {
    self.table = nil;
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.table.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.table sectionAtIndex:section] numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[[self.table sectionAtIndex:indexPath.section] rowAtIndex:indexPath.row] buildForTableView:tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[[self.table sectionAtIndex:indexPath.section] rowAtIndex:indexPath.row] tap];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.table sectionAtIndex:section] header];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [[self.table sectionAtIndex:section] footer];
}

#pragma - Misc

- (UITableViewCell *)memoizedCell:(NSString *)identifier {
    return [[self.table memoizedRowWithIdentifier:identifier] memoizedCell];
}
@end
