#import "SimpleCell.h"

@implementation SimpleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.textField = [[[UITextField alloc] init] autorelease];
        self.textField.frame = CGRectMake(130, 5, 160, 34);
        self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self.contentView addSubview:self.textField];
    }
    return self;
}

- (void)dealloc {
    self.textField = nil;
    [super dealloc];
}
@end
