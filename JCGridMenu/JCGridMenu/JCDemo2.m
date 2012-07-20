//
//  JCDemo2.m
//  JCGridMenu
//
//  Created by Joseph Carney on 20/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCDemo2.h"

@interface JCDemo2 ()

@end

@implementation JCDemo2

#define GM_TAG        1002
@synthesize gmDemo = _gmDemo;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setView:[[JCUIViewTransparent alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
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
        JCGridMenuColumn *twitter = [[JCGridMenuColumn alloc] 
                                     initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                     normal:@"Twitter" 
                                     selected:@"TwitterSelected" 
                                     highlighted:@"TwitterSelected" 
                                     disabled:@"Twiiter"];
        //[twitter.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.8f]];
        [twitter setCloseOnSelect:NO];
        
        JCGridMenuColumn *email = [[JCGridMenuColumn alloc] 
                                   initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                   normal:@"Email" 
                                   selected:@"EmailSelected" 
                                   highlighted:@"EmailSelected" 
                                   disabled:@"Email"];
        //[email.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.8f]];
        [email setCloseOnSelect:NO];
        
        JCGridMenuColumn *pocket = [[JCGridMenuColumn alloc] 
                                    initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                    normal:@"Pocket" 
                                    selected:@"PocketSelected" 
                                    highlighted:@"PocketSelected" 
                                    disabled:@"Pocket"];
        //[pocket.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.8f]];
        [pocket setCloseOnSelect:NO];
        
        JCGridMenuColumn *facebook = [[JCGridMenuColumn alloc] 
                                      initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                      normal:@"Facebook" 
                                      selected:@"FacebookSelected" 
                                      highlighted:@"FacebookSelected" 
                                      disabled:@"Facebook"];
        //[facebook.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.8f]];
        [facebook setCloseOnSelect:NO];
        
        JCGridMenuRow *share = [[JCGridMenuRow alloc] initWithImages:@"Share" selected:@"Close" highlighted:@"ShareSelected" disabled:@"Share"];
        [share setColumns:[[NSMutableArray alloc] initWithObjects:pocket, twitter, facebook, email, nil]];
        [share setIsModal:NO];
        
        NSArray *rows = [[NSArray alloc] initWithObjects:share, nil];
        _gmDemo = [[JCGridMenuController alloc] initWithFrame:CGRectMake(0,220,290,(44*[rows count])+[rows count]) rows:rows tag:GM_TAG];
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
        
        // We can change the share button icon here...
        
        [[[[_gmDemo rows] objectAtIndex:indexRow] button] setSelected:isExpand];
    }
    
}

- (void)jcGridMenuColumnSelected:(NSInteger)indexTag indexRow:(NSInteger)indexRow indexColumn:(NSInteger)indexColumn
{
    NSLog(@"jcGridMenuColumnSelected %i %i %i", indexTag, indexRow, indexColumn);
    
    if (indexTag==GM_TAG) {
    }
    
}

@end
