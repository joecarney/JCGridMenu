//
//  JCGridMenuRow.h
//
//  Created by Joseph Carney on 15/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//
//
//  Every menu must contain at least one row, with a default button as a column
//  From here, when touched we can expand each row with additional columns.  How
//  the columns appear and behave can be controlled from the properties here
//  and inside the JCGridMenuController object
//

#import <Foundation/Foundation.h>
#import "JCGridMenuColumn.h"

@interface JCGridMenuRow : NSObject
{
    UIButton *button;
    BOOL isSelected;
    BOOL isSeperated;
    BOOL isExpanded;
    NSMutableArray *columns;
    BOOL isModal;
    CGFloat hideAlpha;
}

@property (nonatomic, strong) UIButton *button;
@property BOOL isSeperated;
@property BOOL isExpanded;
@property BOOL isSelected;
@property (nonatomic, strong) NSMutableArray *columns;
@property BOOL hideOnExpand;
@property BOOL isModal;
@property CGFloat hideAlpha;

#pragma mark - Initialisation Options

- (id)initWithImages:(NSString *)normal selected:(NSString *)selected highlighted:(NSString *)highlighted disabled:(NSString *)disabled;

@end
