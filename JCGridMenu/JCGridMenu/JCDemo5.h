//
//  JCDemo5.h
//  JCGridMenu
//
//  Created by Joseph Carney on 20/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCGridMenuController.h"

@interface JCDemo5 : UIViewController <JCGridMenuControllerDelegate>
{
    
}

@property (nonatomic, strong) JCGridMenuController *gmDemo1;
@property (nonatomic, strong) JCGridMenuController *gmDemo2;

- (id)init;
- (void)open;
- (void)close;

@end
