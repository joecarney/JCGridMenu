//
//  JCGridMenuRow.m
//
//  Created by Joseph Carney on 15/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCGridMenuRow.h"

@implementation JCGridMenuRow
@synthesize button = _button;
@synthesize isSeperated = _isSeperated;
@synthesize isSelected = _isSelected;
@synthesize isExpanded = _isExpanded;
@synthesize columns = _columns;
@synthesize hideOnExpand = _hideOnExpand;
@synthesize hideAlpha = _hideAlpha;
@synthesize isModal = _isModal;

- (id)init
{
    self = [super init];
    
    if (self) {
        _isSeperated = NO;
        _isExpanded = NO;
        _isSelected = NO;
        _hideOnExpand = NO;
        _isModal = NO;
        _columns = [[NSMutableArray alloc] init];
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        _hideAlpha = 0.3;
    }
    
    return self;
}

- (id)initWithImages:(NSString *)normal selected:(NSString *)selected highlighted:(NSString *)highlighted disabled:(NSString *)disabled
{
    self = [self init];
    [_button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    [_button setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    [_button setImage:[UIImage imageNamed:disabled] forState:UIControlStateDisabled];
    return self;
}

@end
