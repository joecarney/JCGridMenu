//
//  JCTabMenuView.h
//  JCTabMenu
//
//  Created by Joseph Carney on 13/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "JCGridMenuRow.h"


@protocol JCGridMenuViewDelegate <NSObject>
@optional
- (void)jcGridMenuViewRowSelected:(NSInteger)indexRow;
- (void)jcGridMenuViewColumnSelected:(NSInteger)indexColumn;
@end


@interface JCGridMenuView : UIView
{
    id<JCGridMenuViewDelegate> delegate;
    JCGridMenuRow *row;
    UIButton *button;
    NSMutableArray *buttons;
}

@property (nonatomic, weak) id<JCGridMenuViewDelegate> delegate;
@property (nonatomic, strong) JCGridMenuRow *row;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSMutableArray *buttons;
@property NSInteger rowOrder;
@property BOOL isExpanded;
@property CGFloat resetX;
@property CGFloat resetY;
@property CGFloat hideX;
@property CGFloat hideY;
@property CGFloat expandWidth;

#pragma mark - Display

- (void)clear;
- (void)show;
- (void)hide;

#pragma mark - Selections

- (void)expand:(NSInteger)indexRow;
- (void)collapse:(NSInteger)indexRow;
- (void)seperate:(BOOL)isSeperate;
- (void)reset;

@end
