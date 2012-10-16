#import "TTableController.h"
#import "TTable.h"
#import "TSection.h"
#import "TRow.h"

@implementation TTableController
@synthesize table = table_;

- (void)setUpTable {
    NSAssert(NO, @"Subclasses must overwrite this method either manually or with the help of TDSL.h");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTable];
}

- (void)viewDidUnload {
    [table_ release];
    table_ = nil;
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [table_ numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[table_ sectionAtIndex:section] numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[[table_ sectionAtIndex:indexPath.section] rowAtIndex:indexPath.row] buildForTableView:tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[[table_ sectionAtIndex:indexPath.section] rowAtIndex:indexPath.row] tap];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[table_ sectionAtIndex:section] header];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [[table_ sectionAtIndex:section] footer];
}

#pragma - Misc

- (UITableViewCell *)memoizedCell:(NSString *)identifier {
    return [[table_ memoizedRowWithIdentifier:identifier] memoizedCell];
}
@end