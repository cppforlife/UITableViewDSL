#import "TTable.h"
#import "TSection.h"
#import "TRow.h"

// * use controller local variable inside blocks to
//   avoid having self retained which will cause a retain cycle
// * controller's description is called
//   to avoid compiler warning for unused variables
#define  defineTable  - (void)setUpTable{                                       \
                        __block id controller = self;                           \
                        [controller description];                               \
                        TTable *table = self.table = [[[TTable alloc] init] autorelease];

#define  addSection  for (__block TSection *section = table.blankSection; section;) \
                        for (id                                                 \
                                header = nil,                                   \
                                footer = nil;                                   \
                             section;                                           \
                                section.header = header,                        \
                                section.footer = footer,                        \
                             section = nil)                                     \

#define  addRow      for (__block TRow *row = section.blankRow; row;)           \
                        for (id                                                 \
                                className = nil,                                \
                                identifier = nil,                               \
                                text = nil,                                     \
                                detail = nil,                                   \
                                build = nil,                                    \
                                customize = nil,                                \
                                onTap = nil;                                    \
                             row;                                               \
                                row.className = className,                      \
                                row.identifier = identifier,                    \
                                row.text = text,                                \
                                row.detail = detail,                            \
                                row.build = build,                              \
                                row.customize = customize,                      \
                                row.onTap = onTap,                              \
                             row = nil)                                         \

#define  addMemoizedRow(cellIdentifier, cellClassName) \
                     for (__block TRow *row = section.blankRow; row;)           \
                        for (id                                                 \
                                text = nil,                                     \
                                detail = nil,                                   \
                                build = nil,                                    \
                                customize = nil,                                \
                                onTap = nil;                                    \
                             row;                                               \
                                row.identifier = cellIdentifier,                \
                                row.className = cellClassName,                  \
                                row.memoize = YES,                              \
                                row.text = text,                                \
                                row.detail = detail,                            \
                                row.build = build,                              \
                                row.customize = customize,                      \
                                row.onTap = onTap,                              \
                             row = nil)                                         \
