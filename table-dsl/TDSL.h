#import "TTable.h"
#import "TSection.h"
#import "TRow.h"

// - use `controller` local var inside blocks to avoid having self retained
// - `[controller description]` avoids compiler warning for unused variable
#define  defineTable  - (void)setUpTable {                                      \
                        __block typeof(self) controller = self;                 \
                        __block TTable *table = self.table =                    \
                            [[[TTable alloc] init] autorelease];                \
                        [controller description];                               \

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
