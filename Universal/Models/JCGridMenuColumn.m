//
//  JCGridMenuColumn.m
//
//  Created by Joseph Carney on 17/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCGridMenuColumn.h"

@implementation JCGridMenuColumn

@synthesize columnType = _optionType;
@synthesize view = _view;
@synthesize button = _button;
@synthesize spacing = _spacing;
@synthesize closeOnSelect = _closeOnSelect;

#pragma mark - Init

- (id)init
{
    self = [super init];
    
    if (self) {
        _spacing = 1;
        _closeOnSelect = YES;
    }
    
    return self;
}

- (id)initWithView:(CGRect)frame
{
    self = [self init];
    _view = [[UIView alloc] initWithFrame:frame];
    [_view setBackgroundColor:[UIColor clearColor]]; 
    _optionType = JCGridMenuColumnTypeView;
    return self;
}

- (id)initWithButton:(CGRect)frame;
{
    self = [self init];
    _button = [[UIButton alloc] initWithFrame:frame];
    [_button setBackgroundColor:[UIColor clearColor]]; 
    _optionType = JCGridMenuColumnTypeButton;
    return self;
}

- (id)initWithButtonAndImages:(CGRect)frame normal:(NSString *)normal selected:(NSString *)selected highlighted:(NSString *)highlighted disabled:(NSString *)disabled
{
    self = [self initWithButton:frame];
    [_button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    [_button setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    [_button setImage:[UIImage imageNamed:disabled] forState:UIControlStateDisabled];
    return self;
}

- (id)initWithButtonImageTextLeft:(CGRect)frame image:(NSString *)image selected:(NSString *)selected text:(NSString *)text
{
    self = [self init];
    _button = [[UIButton alloc] initWithImageTextLeft:frame image:image selected:(NSString *)selected text:text];
    _optionType = JCGridMenuColumnTypeButton;
    return self;
}


@end
