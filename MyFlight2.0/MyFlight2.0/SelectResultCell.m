//
//  SelectResultCell.m
//  MyFlight2.0
//
//  Created by sss on 12-12-6.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import "SelectResultCell.h"

@implementation SelectResultCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {

    [_temporaryLabel release];
    [_airPort release];
    [_palntType release];
    [_beginTime release];
    [_endTime release];
    [_pay release];
    [_discount release];
    [_ticketCount release];
    [super dealloc];
}
@end
