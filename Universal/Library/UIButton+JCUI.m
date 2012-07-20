//
//  UIButton+JCUI.m
//
//  Created by Joseph Carney on 14/05/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "UIButton+JCUI.h"
#import "UILabel+JCUI.h"

@implementation UIButton (JCUI)

- (UIButton *)initWithImageTextLeft:(CGRect)frame image:(NSString *)image selected:(NSString *)selected text:(NSString *)text;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addSubview:[[UILabel alloc] buttonText:text withFrame:CGRectMake(30, 0, frame.size.width-34, frame.size.height)]];
    [button setShowsTouchWhenHighlighted:YES];
    [button setFrame:frame];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, (-frame.size.width)+32, 0, 0)];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    return button;
}

@end
