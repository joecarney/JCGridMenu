//
//  JCGridMenuColumn.h
//
//  Created by Joseph Carney on 17/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//
//
//  Once you select a button on a row, it will expand into a number of columns
//  that are either more buttons, or views.  
//

#import <Foundation/Foundation.h>
#import "UIButton+JCUI.h"

typedef enum
{
	JCGridMenuColumnTypeButton,
	JCGridMenuColumnTypeView	
} JCGridMenuColumnType;


@interface JCGridMenuColumn : NSObject
{
    NSInteger columnType;
    UIButton *button;
    UIView *view;
    CGFloat spacing;
    BOOL closeOnSelect;
}

@property NSInteger columnType;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIView *view;
@property CGFloat spacing;
@property BOOL closeOnSelect;

#pragma mark - Init

- (id)initWithView:(CGRect)frame;
- (id)initWithButton:(CGRect)frame;
- (id)initWithButtonAndImages:(CGRect)frame normal:(NSString *)normal selected:(NSString *)selected highlighted:(NSString *)highlighted disabled:(NSString *)disabled;
- (id)initWithButtonImageTextLeft:(CGRect)frame image:(NSString *)image selected:(NSString *)selected text:(NSString *)text;

@end
