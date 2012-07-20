//
//  UILabel+JCUI.h
//
//  Created by Joseph Carney on 14/05/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UILabel (JCUI)

- (UILabel *)buttonText:(NSString *)text withFrame:(CGRect)frame;
- (UILabel *)demoTitle:(NSString *)text frame:(CGRect)frame;
- (UILabel *)demoText:(NSString *)text frame:(CGRect)frame;

@end
