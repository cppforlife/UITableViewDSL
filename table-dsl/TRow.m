#import "TRow.h"

typedef UITableViewCell* (^BuildBlock)(TRow *row);
typedef void (^CustomizeBlock)(UITableViewCell *);
typedef void (^TapBlock)(void);

@implementation TRow
@synthesize className, identifier, text, detail, build, customize, onTap, memoize, memoizedCell;

- (void)dealloc {
    self.className = nil;
    self.identifier = nil;
    self.text = nil;
    self.detail = nil;
    self.build = nil;
    self.customize = nil;
    self.onTap = nil;
    self.memoizedCell = nil;
    [super dealloc];
}

- (UITableViewCell *)buildForTableView:(UITableView *)tableView {
    UITableViewCell *cell = nil;

    // memoized cells should never be shared hence no dequeue
    if (self.isMemoized) {
        if (self.memoizedCell) return self.memoizedCell;
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:self.identifier];
    }

    if (!cell) {
        if (self.build) {
            cell = ((BuildBlock)self.build)(self);
        } else {
            cell = self.plainBuild;
        }
    }

    if (self.isMemoized)
        self.memoizedCell = cell;

    if (self.text) cell.textLabel.text = self.text;
    if (self.detail) cell.detailTextLabel.text = self.detail;

    if (self.customize) ((CustomizeBlock)self.customize)(cell);
    if ([cell respondsToSelector:@selector(customize)]) [(id)cell customize];
    return cell;
}

- (void)tap {
    if (self.onTap) ((TapBlock)self.onTap)();
}

- (UITableViewCell *)plainBuild {
    Class cellClass = self.className ? NSClassFromString(self.className) : [UITableViewCell class];
    return [[[cellClass alloc] initWithStyle:UITableViewCellStyleSubtitle
                               reuseIdentifier:self.identifier] autorelease];
}
@end
