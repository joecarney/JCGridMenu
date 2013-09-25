//
//  JCTabMenuView.m
//  JCTabMenu
//
//  Created by Joseph Carney on 13/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCGridMenuView.h"

@implementation JCGridMenuView

@synthesize delegate = _delegate;
@synthesize row = _row;
@synthesize button = _button;
@synthesize buttons = _buttons;
@synthesize rowOrder = _rowOrder;
@synthesize isExpanded = _isExpanded;
@synthesize resetX = _resetX;
@synthesize resetY = _resetY;
@synthesize hideX = _hideX;
@synthesize hideY = _hideY;
@synthesize expandWidth = _expandWidth;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // Move offscreen before animations
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - Display

- (void)clear
{
    NSArray *viewsAll = [self subviews];
    
    for (UIView *viewRemove in viewsAll) {
        
        if ([viewRemove isKindOfClass:[UIButton class]]) {
            [(UIButton *)viewRemove removeTarget:self action:NULL forControlEvents:UIControlEventAllEvents];
        }
        
        [viewRemove removeFromSuperview];
    }
    
}


- (void)show
{
    _isExpanded = NO;
    CGFloat centerX = self.layer.position.x;
    CGFloat centerY = self.layer.position.y;
    
    _hideX = centerX + 44;
    _hideY = centerY;
    
    centerX -= 44;
    centerY = 22;
    
    CGFloat xStart = centerX;
    CGFloat xEnd = centerX;
    
    CGFloat yStart = centerY +22;   // drop in from the top, the first tab 
    CGFloat yEnd = centerY + (_rowOrder * self.frame.size.height) + _rowOrder +22;

    _resetX = xEnd;
    _resetY = yEnd;
    
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.layer setPosition:CGPointMake(xStart+44, yStart)];
                         [_button setSelected:[_row isSelected]];
                         [_button setTag:_rowOrder];
                         [_button addTarget:self action:@selector(jcGridMenuViewRowSelected:) forControlEvents:UIControlEventTouchUpInside];
                         [self addSubview:_button];
                         [self.layer setPosition:CGPointMake(xEnd-10, yEnd+10)];
                     } 
                     completion:^(BOOL finished){

                         [UIView animateWithDuration:0.2
                                               delay:0.0
                                             options: UIViewAnimationOptionCurveLinear
                                          animations:^{
                                              [self.layer setPosition:CGPointMake(xEnd, yEnd)];
                                          } 
                                          completion:^(BOOL finished){
                                          }];    
                     
                     }];    
    
}

- (void)hide
{

    [UIView animateWithDuration:0.4
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.layer setPosition:CGPointMake(_hideX, _hideY)];
                     } 
                     completion:^(BOOL finished){
                         [self clear];
                         [self removeFromSuperview];
                     }];    

}

#pragma mark - Button touches for rows/columns 

- (void)jcGridMenuViewRowSelected:(id)sender
{
    //NSLog(@"jcGridMenuViewRowSelected");
    UIButton *touched = (UIButton *)sender;
    
    if ([self.delegate respondsToSelector:@selector(jcGridMenuViewRowSelected:)]) {
        //NSLog(@"respondsToSelector jcGridMenuViewRowSelected");
        [self.delegate jcGridMenuViewRowSelected:touched.tag];
    }
    
}

- (void)jcGridMenuViewColumnSelected:(id)sender
{
    //NSLog(@"jcGridMenuViewColumnSelected");
    UIButton *touched = (UIButton *)sender;
    
    if ([self.delegate respondsToSelector:@selector(jcGridMenuViewColumnSelected:)]) {
        //NSLog(@"respondsToSelector jcGridMenuViewColumnSelected");
        [self.delegate jcGridMenuViewColumnSelected:touched.tag];
    }
    
}


#pragma mark - Selections

- (void)expand:(NSInteger)indexRow
{
    BOOL canExpand = NO;

    if ([_row.columns count]>0) {
        canExpand = YES;
    }
    
    _isExpanded = YES;
    
    if (canExpand) {
        CGFloat left = 44+ 1;
        
        if ([_row hideOnExpand]) {
            [_button setAlpha:0];
        }
        
        CGRect frame;
        
        _buttons = [[NSMutableArray alloc] init];
        
        for (int i=0; i<[_row.columns count]; i++) {
            NSInteger tagExpand = ((indexRow+1)*100)+i;
            JCGridMenuColumn *item = [_row.columns objectAtIndex:i];
            
            if (item.columnType == JCGridMenuColumnTypeButton) {
                UIButton *buttonExists = (UIButton *)[self viewWithTag:tagExpand];
                
                if (! buttonExists) {
                    buttonExists = (UIButton *)[[_row.columns objectAtIndex:i] button];
                    frame = [buttonExists frame];
                    [buttonExists setFrame:CGRectMake(left, 0, frame.size.width, frame.size.height)];
                    [buttonExists setTag:tagExpand];
                    [buttonExists addTarget:self action:@selector(jcGridMenuViewColumnSelected:) forControlEvents:UIControlEventTouchUpInside];
                    [self addSubview:buttonExists];
                    left += frame.size.width;
                    
                    
                    if (i<[_row.columns count]-1) {
                        left += [[_row.columns objectAtIndex:i] spacing];
                    }
                    
                    _expandWidth = left;
                }
                
                [_buttons addObject:buttonExists];
            } else {
                UIView *viewExists = (UIView *)[self viewWithTag:tagExpand];
                
                if (! viewExists) {
                    viewExists = (UIView *)[[_row.columns objectAtIndex:i] view];
                    frame = [viewExists frame];
                    [viewExists setFrame:CGRectMake(left, 0, frame.size.width, frame.size.height)];
                    [viewExists setTag:tagExpand];
                    [self addSubview:viewExists];
                    left += frame.size.width;

                    if (i<[_row.columns count]-1) {
                        left += [[_row.columns objectAtIndex:i] spacing];
                    }
                    
                    _expandWidth = left;
                }
                
            }
            
        }
        
        CGFloat centerX = self.layer.position.x;
        CGFloat centerY = self.layer.position.y;
        
        [UIView animateWithDuration:0.2
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [self.layer setPosition:CGPointMake((centerX -_expandWidth) +44, centerY)];
                         } 
                         completion:^(BOOL finished){
                         }];    
    }
    
}

- (void)collapse:(NSInteger)indexRow
{
    _isExpanded = NO;
    [self reset];
}

- (void)seperate:(BOOL)isSeperate
{
    CGFloat centerX = _resetX;
    CGFloat centerY = self.layer.position.y;
    
    if (isSeperate) {
        centerY += 20;
    } else {
        centerY -= 20;
    }

    [UIView animateWithDuration:0.2
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.layer setPosition:CGPointMake(centerX, centerY)];
                     } 
                     completion:^(BOOL finished){
                     }];    

}

- (void)reset
{
    BOOL needsReset = YES;
    
    if (_resetY == self.layer.position.y) {

        if (_resetX == self.layer.position.x) {
            needsReset = NO;
        }
        
    }
    
    if (needsReset) {
        [UIView animateWithDuration:0.2
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                             if ([_row hideOnExpand]) {
                                 [self bringSubviewToFront:_button];
                                 [_button setAlpha:1];
                             }
                             
                             [self.layer setPosition:CGPointMake(_resetX, _resetY)];
                         } 
                         completion:^(BOOL finished){
                         }];    
    }
    
}

@end
