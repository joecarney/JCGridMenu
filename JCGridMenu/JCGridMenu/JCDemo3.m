//
//  JCDemo3.m
//  JCGridMenu
//
//  Created by Joseph Carney on 20/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCDemo3.h"

@interface JCDemo3 ()

@end

@implementation JCDemo3

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

        // Search
        
        JCGridMenuColumn *searchInput = [[JCGridMenuColumn alloc] 
                                         initWithView:CGRectMake(0, 0, 264, 44)];
        [searchInput.view setBackgroundColor:[UIColor whiteColor]];
        
        JCGridMenuColumn *searchClose = [[JCGridMenuColumn alloc] 
                                         initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                         normal:@"Close" 
                                         selected:@"CloseSelected" 
                                         highlighted:@"CloseSelected" 
                                         disabled:@"Close"];
        
        JCGridMenuRow *search = [[JCGridMenuRow alloc] 
                                 initWithImages:@"Search" 
                                 selected:@"CloseSelected" 
                                 highlighted:@"SearchSelected" 
                                 disabled:@"Search"];
        [search.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.4f]];
        [search setHideOnExpand:YES];
        [search setIsModal:YES];
        [search setHideAlpha:0.2f];
        [search setIsSeperated:YES];
        [search setColumns:[[NSMutableArray alloc] initWithObjects:searchInput, searchClose, nil]];
        
        // Share...
        
        JCGridMenuColumn *twitter = [[JCGridMenuColumn alloc] 
                                     initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                     normal:@"Twitter" 
                                     selected:@"TwitterSelected" 
                                     highlighted:@"TwitterSelected" 
                                     disabled:@"Twiiter"];
        [twitter.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.8f]];
        [twitter setCloseOnSelect:YES];
        
        JCGridMenuColumn *email = [[JCGridMenuColumn alloc] 
                                   initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                   normal:@"Email" 
                                   selected:@"EmailSelected" 
                                   highlighted:@"EmailSelected" 
                                   disabled:@"Email"];
        [email.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.8f]];
        [email setCloseOnSelect:YES];
        
        JCGridMenuColumn *pocket = [[JCGridMenuColumn alloc] 
                                    initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                    normal:@"Pocket" 
                                    selected:@"PocketSelected" 
                                    highlighted:@"PocketSelected" 
                                    disabled:@"Pocket"];
        [pocket.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.8f]];
        [pocket setCloseOnSelect:YES];
        
        JCGridMenuColumn *facebook = [[JCGridMenuColumn alloc] 
                                      initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                      normal:@"Facebook" 
                                      selected:@"FacebookSelected" 
                                      highlighted:@"FacebookSelected" 
                                      disabled:@"Facebook"];
        [facebook.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.8f]];
        [facebook setCloseOnSelect:YES];
        
        JCGridMenuRow *share = [[JCGridMenuRow alloc] initWithImages:@"Share" selected:@"CloseSelected" highlighted:@"ShareSelected" disabled:@"Share"];
        [share setColumns:[[NSMutableArray alloc] initWithObjects:pocket, twitter, facebook, email, nil]];
        [share setIsModal:YES];
        [share setHideAlpha:0.2f];
        [share setIsSeperated:YES];
        [share.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.4f]];        
        
        // Rows...
        
        NSArray *rows = [[NSArray alloc] initWithObjects:search, share, nil];
        _gmDemo = [[JCGridMenuController alloc] initWithFrame:CGRectMake(0,20,320,(44*[rows count])+[rows count]) rows:rows tag:GM_TAG];
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
    [self searchInput:NO];
    [_gmDemo close];   
}



#pragma mark - JCGridMenuController Delegate

- (void)jcGridMenuRowSelected:(NSInteger)indexTag indexRow:(NSInteger)indexRow isExpand:(BOOL)isExpand
{
    NSLog(@"jcGridMenuRowSelected");
    
    if (indexTag==GM_TAG) {
        JCGridMenuRow *rowSelected = (JCGridMenuRow *)[_gmDemo.rows objectAtIndex:indexRow];
        
        if (indexRow==0) {
            // Search
            [[rowSelected button] setSelected:YES];
            [self searchInput:YES];
        }
        
    }
    
}

- (void)jcGridMenuColumnSelected:(NSInteger)indexTag indexRow:(NSInteger)indexRow indexColumn:(NSInteger)indexColumn
{
    NSLog(@"jcGridMenuColumnSelected");
    
    if (indexTag==GM_TAG) {
        
        if (indexRow==0) {
            // Search
            [self searchInput:NO];
            [[[_gmDemo.gridCells objectAtIndex:indexRow] button] setSelected:NO];
        }
        
        [_gmDemo setIsRowModal:NO];
    }
    
}


#pragma mark - Demo specific controls

- (void)searchInput:(BOOL)isDisplay
{
    UITextView *text;
    
    if (isDisplay) {
        text = [[UITextView alloc] initWithFrame:CGRectMake(15, 35, 100, 20)];
        [text setBackgroundColor:[UIColor clearColor]];
        [text setKeyboardAppearance:UIKeyboardAppearanceAlert];
        [text setTag:12345];
        [self.view addSubview:text];
        [text performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.2];
    } else {
        text = (UITextView *)[self.view viewWithTag:12345];
        [text resignFirstResponder];
        [text removeFromSuperview];
    }
    
}
@end
