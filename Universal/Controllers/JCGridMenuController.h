//
//  JCGridMenuController.h
//
//  Created by Joseph Carney on 13/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//
//
//  This is the main controller for displaying the initial rows and talking to the delegate.
//  The properties and data held JCGridMenuRow and JCGridMenuColumn models are used to the behaviour 
//  to control the JCGridMenuRowView which displays the relevant views and buttons.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "JCGridMenuView.h"
#import "JCGridMenuRow.h"
#import "JCGridMenuColumn.h"
#import "UIView+JCUI.h"

@protocol JCGridMenuControllerDelegate <NSObject>
@optional
- (void)jcGridMenuRowSelected:(NSInteger)tag indexRow:(NSInteger)indexRow isExpand:(BOOL)isExpand;
- (void)jcGridMenuColumnSelected:(NSInteger)tag indexRow:(NSInteger)indexRow indexColumn:(NSInteger)indexColumn;
@end

@interface JCGridMenuController : UIViewController <JCGridMenuViewDelegate>
{
    id<JCGridMenuControllerDelegate> delegate;
}

@property (nonatomic, weak) id<JCGridMenuControllerDelegate> delegate;
@property (nonatomic, retain) NSArray *rows;
@property (nonatomic, retain) NSArray *rowsReset;
@property (nonatomic, retain) NSMutableArray *gridCells;
@property NSInteger rowSelected;
@property BOOL isRowModal;
@property NSInteger tag;

- (id)initWithFrame:(CGRect)frame rows:(NSArray *)initRows tag:(NSInteger)initTag;

#pragma mark - Open and Close

- (void)open;
- (void)close;

@end
