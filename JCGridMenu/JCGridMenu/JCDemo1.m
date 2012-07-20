//
//  JCDemo1.m
//
//  Created by Joseph Carney on 20/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCDemo1.h"

#define GM_TAG        1001

@interface JCDemo1 ()

@end


@implementation JCDemo1

@synthesize gmDemo = _gmDemo;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setView:[[JCUIViewTransparent alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Initialise

- (id)init
{
    self = [super init];
    if (self) {
        JCGridMenuRow *pocket = [[JCGridMenuRow alloc] 
                                 initWithImages:@"Pocket" 
                                 selected:@"PocketSelected" 
                                 highlighted:@"PocketSelected" 
                                 disabled:@"Pocket"];
        JCGridMenuRow *twitter = [[JCGridMenuRow alloc] 
                                  initWithImages:@"Twitter" 
                                  selected:@"TwitterSelected" 
                                  highlighted:@"TwitterSelected" 
                                  disabled:@"Twitter"];
        JCGridMenuRow *facebook = [[JCGridMenuRow alloc] 
                                  initWithImages:@"Facebook" 
                                  selected:@"FacebookSelected" 
                                  highlighted:@"FacebookSelected" 
                                  disabled:@"Facebook"];
        JCGridMenuRow *email = [[JCGridMenuRow alloc] 
                                   initWithImages:@"Email" 
                                   selected:@"EmailSelected" 
                                   highlighted:@"EmailSelected" 
                                   disabled:@"Email"];
        
        NSArray *rows = [[NSArray alloc] initWithObjects:pocket, twitter, facebook, email, nil];
        _gmDemo = [[JCGridMenuController alloc] initWithFrame:CGRectMake(0, 20, 320, (44*[rows count])+[rows count]) rows:rows tag:GM_TAG];
        [_gmDemo setDelegate:self];
        [self.view addSubview:_gmDemo.view];
    }
    return self;
}


#pragma mark - Open and Close

- (void)open
{
     [_gmDemo open];   
}

- (void)close
{
    [_gmDemo close];   
}



#pragma mark - JCGridMenuController Delegate

- (void)jcGridMenuRowSelected:(NSInteger)indexTag indexRow:(NSInteger)indexRow isExpand:(BOOL)isExpand
{
    
    if (isExpand) {
        NSLog(@"jcGridMenuRowSelected %i %i isExpand", indexTag, indexRow);
    } else {
        NSLog(@"jcGridMenuRowSelected %i %i !isExpand", indexTag, indexRow);
    }
    
    if (indexTag==GM_TAG) {
    }
    
}

- (void)jcGridMenuColumnSelected:(NSInteger)indexTag indexRow:(NSInteger)indexRow indexColumn:(NSInteger)indexColumn
{
    NSLog(@"jcGridMenuColumnSelected %i %i %i", indexTag, indexRow, indexColumn);
    
    if (indexTag==GM_TAG) {
    }
    
}





@end
