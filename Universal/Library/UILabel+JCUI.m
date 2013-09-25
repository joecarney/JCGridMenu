//
//  UILabel+JCUI.m
//
//  Created by Joseph Carney on 14/05/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "UILabel+JCUI.h"

@implementation UILabel (JCUI)

- (UILabel *)buttonText:(NSString *)text withFrame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setNumberOfLines:1];
    [label setValue:text forKey:@"text"];
    [label setTextColor:[UIColor colorWithWhite:1.0 alpha:0.9]];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:13.0f]];
    [label setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.2f]];
    [label setShadowOffset:CGSizeMake(1.0f, 1.0f)];
    return label;
}

- (UILabel *)demoTitle:(NSString *)text frame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setNumberOfLines:1000];
    [label setValue:text forKey:@"text"];
    [label setTextColor:[UIColor colorWithWhite:0.0 alpha:0.9]];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:24.0f]];
    [label setShadowColor:[UIColor colorWithWhite:1.0f alpha:0.4f]];
    [label setShadowOffset:CGSizeMake(1.0f, 1.0f)];
    [self labelResize:label frame:frame font:[UIFont systemFontOfSize:24.0f]];
    return label;
}

- (UILabel *)demoText:(NSString *)text frame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setNumberOfLines:1000];
    [label setValue:text forKey:@"text"];
    [label setTextColor:[UIColor colorWithWhite:0.0 alpha:0.7]];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:14.0f]];
    [label setShadowColor:[UIColor colorWithWhite:1.0f alpha:0.4f]];
    [label setShadowOffset:CGSizeMake(1.0f, 1.0f)];
    [self labelResize:label frame:frame font:[UIFont systemFontOfSize:14.0f]];
    return label;
}

- (void)labelResize:(UILabel *)label frame:(CGRect)frame font:(UIFont *)font
{
    CGSize sizeMax = frame.size;
    CGSize sizeConstrained = [[label text] sizeWithFont:font constrainedToSize:sizeMax]; 
    frame.size.height = sizeConstrained.height;
    frame.size.width = sizeConstrained.width;
    [label setFrame:frame];
}


@end
