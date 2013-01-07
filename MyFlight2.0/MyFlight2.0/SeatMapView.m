//
//  SeatMapView.m
//  MyFlight2.0
//
//  Created by lianyou on 13-1-3.
//  Copyright (c) 2013年 LIAN YOU. All rights reserved.
//

#import "SeatMapView.h"

@implementation SeatMapView

@synthesize sectionX;
@synthesize sectionY;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        selectionX = -1;
        selectionY = -1;
    }
    return self;
}

- (void) drawSeatMap:(NSDictionary *)responseDictionary
{
    if(map == NULL)
    {
        map = (char *) malloc(sectionX * sectionY * sizeof(char));
    }
    
    for(UIView *view in [self subviews])
    {
        [view removeFromSuperview];
    }
    
    NSInteger i = 0;
    NSInteger j = 0;
    
    for(i = 0; i < sectionX; i++)
    {
        for(j = 0; j < sectionY; j++)
        {
            switch(map[i * sectionY + j])
            {
                case '=':
                    break;
                default:
                    break;
            }
        }
    }
}

- (NSString *) currentSeatChoosed:(NSDictionary *)responseDictionary
{
    if(selectionX == -1 && selectionY == -1)
    {
        NSString *returnValue = [[NSString alloc] initWithString:@""];
        return [returnValue autorelease];
    }
    else
    {
        return nil;
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint position = [[touches anyObject] locationInView:self];
    
    NSInteger select_X = position.x / self.frame.size.width * sectionX;
    NSInteger select_Y = position.y / self.frame.size.height * sectionY;
    
    if(selectionX == select_X && selectionY == select_Y)
    {
        selectionX = -1;
        selectionY = -1;
    }
    else
    {
        selectionX = select_X;
        selectionY = select_Y;
    }
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) dealloc
{
    free(map);
    
    [super dealloc];
}

@end