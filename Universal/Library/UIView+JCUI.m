//
//  UIView+JCUI.m
//  CalendFriends
//
//  Created by Joseph Carney on 14/05/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "UIView+JCUI.h"
#import "UILabel+JCUI.h"

@implementation UIView (JCUI)
@end


@implementation JCUIViewTransparent

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        // Initialization code
        [self setUserInteractionEnabled:YES];
    }
    
    return self;
    
}

- (id)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    id hitView = [super hitTest:point withEvent:event];
    
    if (hitView == self) {
        return nil;
    } else {
        return hitView;
    }
    
}


@end