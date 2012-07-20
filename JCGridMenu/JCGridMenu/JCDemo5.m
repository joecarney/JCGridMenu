//
//  JCDemo5.m
//  JCGridMenu
//
//  Created by Joseph Carney on 20/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCDemo5.h"

@interface JCDemo5 ()

@end

@implementation JCDemo5

#define GM_TAG_1        1002
#define GM_TAG_2        1022

@synthesize gmDemo1 = _gmDemo1;
@synthesize gmDemo2 = _gmDemo2;


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
        NSLog(@"init demo2");
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
        [search setHideAlpha:0.0f];
        [search setIsSeperated:NO];
        [search setColumns:[[NSMutableArray alloc] initWithObjects:searchInput, searchClose, nil]];
        
        
        // Share
        
        JCGridMenuColumn *twitter = [[JCGridMenuColumn alloc] 
                                     initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                     normal:@"Twitter" 
                                     selected:@"TwitterSelected" 
                                     highlighted:@"TwitterSelected" 
                                     disabled:@"Twiiter"];
        [twitter.button setBackgroundColor:[UIColor blackColor]];
        
        JCGridMenuColumn *email = [[JCGridMenuColumn alloc] 
                                   initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                   normal:@"Email" 
                                   selected:@"EmailSelected" 
                                   highlighted:@"EmailSelected" 
                                   disabled:@"Email"];
        [email.button setBackgroundColor:[UIColor blackColor]];
        
        JCGridMenuColumn *pocket = [[JCGridMenuColumn alloc] 
                                    initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                    normal:@"Pocket" 
                                    selected:@"PocketSelected" 
                                    highlighted:@"PocketSelected" 
                                    disabled:@"Pocket"];
        [pocket.button setBackgroundColor:[UIColor blackColor]];
        
        JCGridMenuColumn *facebook = [[JCGridMenuColumn alloc] 
                                      initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                      normal:@"Facebook" 
                                      selected:@"FacebookSelected" 
                                      highlighted:@"FacebookSelected" 
                                      disabled:@"Facebook"];
        [facebook.button setBackgroundColor:[UIColor blackColor]];
        
        JCGridMenuRow *share = [[JCGridMenuRow alloc] initWithImages:@"Share" selected:@"CloseSelected" highlighted:@"ShareSelected" disabled:@"Share"];
        [share setColumns:[[NSMutableArray alloc] initWithObjects:pocket, twitter, facebook, email, nil]];
        [share setIsModal:YES];
        [share.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.4f]];
        
        
        // Comments
        
        JCGridMenuRow *comments = [[JCGridMenuRow alloc] initWithImages:@"Comments" selected:@"CommentsSelected" highlighted:@"CommentsSelected" disabled:@"Comments"];
        [comments setHideAlpha:0.0f];
        [comments setIsSeperated:YES];
        [comments setIsModal:YES];
        [comments.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.4f]];
        
        
        // Spam
        
        JCGridMenuRow *spam = [[JCGridMenuRow alloc] initWithImages:@"Spam" selected:@"SpamSelected" highlighted:@"SpamSelected" disabled:@"Spam"];
        [spam setIsSeperated:NO];
        [spam setIsSelected:YES];
        [spam setHideAlpha:1.0f];
        [spam.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.4f]];
        
        
        // Rows...
        
        NSArray *rows1 = [[NSArray alloc] initWithObjects:search, share, comments, spam, nil];
        _gmDemo1 = [[JCGridMenuController alloc] initWithFrame:CGRectMake(0,20,320,(44*[rows1 count])+[rows1 count]) rows:rows1 tag:GM_TAG_1];
        [_gmDemo1 setDelegate:self];
        [self.view addSubview:_gmDemo1.view];

        // Favourites
        
        JCGridMenuColumn *favouriteView = [[JCGridMenuColumn alloc] 
                                           initWithButtonImageTextLeft:CGRectMake(0, 0, 76, 44) 
                                           image:@"FavouriteSmall" 
                                           selected:@"FavouriteSmallSelected" 
                                           text:@"Event"];
        [favouriteView setCloseOnSelect:NO];
        
        JCGridMenuColumn *favouriteObject = [[JCGridMenuColumn alloc] 
                                             initWithButtonImageTextLeft:CGRectMake(0, 0, 80, 44) 
                                             image:@"FavouriteSmall" 
                                             selected:@"FavouriteSmallSelected" 
                                             text:@"Object"];
        [favouriteObject setCloseOnSelect:NO];
        
        JCGridMenuColumn *favouriteMethod = [[JCGridMenuColumn alloc] 
                                             initWithButtonImageTextLeft:CGRectMake(0, 0, 88, 44) 
                                             image:@"FavouriteSmall" 
                                             selected:@"FavouriteSmallSelected" 
                                             text:@"Method"];
        [favouriteMethod setCloseOnSelect:NO];
        
        
        JCGridMenuColumn *favouritesClose = [[JCGridMenuColumn alloc] 
                                             initWithButtonAndImages:CGRectMake(0, 0, 44, 44) 
                                             normal:@"Close" 
                                             selected:@"CloseSelected" 
                                             highlighted:@"CloseSelected" 
                                             disabled:@"Close"];
        [favouritesClose setCloseOnSelect:YES];
        
        JCGridMenuRow *favourites = [[JCGridMenuRow alloc] 
                                     initWithImages:@"Favourite" 
                                     selected:@"Favourite" 
                                     highlighted:@"FavouriteSelected" 
                                     disabled:@"Favourite"];

        
        [favourites setColumns:[[NSMutableArray alloc] initWithObjects:favouriteView, favouriteObject, favouriteMethod, favouritesClose, nil]];
        [favourites setIsExpanded:NO];
        [favourites setIsModal:NO];
        [favourites setHideAlpha:0.8f];
        [favourites setHideOnExpand:YES];
        
        
        
        NSArray *rows2 = [[NSArray alloc] initWithObjects:favourites, nil];
        _gmDemo2 = [[JCGridMenuController alloc] initWithFrame:CGRectMake(0,300,305,(44*[rows2 count])+[rows2 count]) rows:rows2 tag:GM_TAG_2];
        [_gmDemo2 setDelegate:self];
        [self.view addSubview:_gmDemo2.view];
    
    }
    return self;
}


#pragma mark - Open and Close

- (void)open
{
    [_gmDemo1 open];   
    [_gmDemo2 open];   
}

- (void)close
{
    [self searchInput:NO];
    [_gmDemo1 close];   
    [_gmDemo2 close];   
}



#pragma mark - JCGridMenuController Delegate

- (void)jcGridMenuRowSelected:(NSInteger)indexTag indexRow:(NSInteger)indexRow isExpand:(BOOL)isExpand
{
    if (isExpand) {
        NSLog(@"jcGridMenuRowSelected %i %i isExpand", indexTag, indexRow);
    } else {
        NSLog(@"jcGridMenuRowSelected %i %i !isExpand", indexTag, indexRow);
    }
    
    if (indexTag==GM_TAG_1) {
        JCGridMenuRow *rowSelected = (JCGridMenuRow *)[_gmDemo1.rows objectAtIndex:indexRow];
        
        if ([rowSelected.columns count]==0) {
            // If there are no more columns, we can use this button as an on/off switch
            [[rowSelected button] setSelected:![rowSelected button].selected];
        } else {
            
            if (isExpand) {
                
                switch (indexRow) {
                    case 0: // Search
                        [[rowSelected button] setSelected:YES];
                        [self searchInput:YES];
                        break;
                    case 1: // Share
                        [[rowSelected button] setSelected:YES];
                        break;
                }
                
            } else {
                
                switch (indexRow) {
                    case 0: // Search
                        [[rowSelected button] setSelected:NO];
                        break;
                    case 1: // Share
                        [[rowSelected button] setSelected:NO];
                        break;
                }
                
            }
            
        }
    }
    
}

- (void)jcGridMenuColumnSelected:(NSInteger)indexTag indexRow:(NSInteger)indexRow indexColumn:(NSInteger)indexColumn
{
    NSLog(@"jcGridMenuColumnSelected %i %i %i", indexTag, indexRow, indexColumn);
    
    if (indexTag==GM_TAG_1) {
        [[[_gmDemo1.gridCells objectAtIndex:indexRow] button] setSelected:NO];
        [_gmDemo1 setIsRowModal:NO];
        
        if (indexRow==0) {
            // Search
            [self searchInput:NO];
        }
        
    }
    
    if (indexTag==GM_TAG_2) {
        UIButton *selected = (UIButton *)[[[_gmDemo2.gridCells objectAtIndex:indexRow] buttons] objectAtIndex:indexColumn];
        [selected setSelected:![selected isSelected]];
        BOOL hasSelected = NO;
        
        for (int i=0; i<[[[_gmDemo2.gridCells objectAtIndex:indexRow] buttons] count]; i++) {
            
            if ([[[[_gmDemo2.gridCells objectAtIndex:indexRow] buttons] objectAtIndex:i] isSelected]) {
                hasSelected = YES;
                break;
            }
            
        }
        
        [[[_gmDemo2.gridCells objectAtIndex:indexRow] button] setSelected:hasSelected];
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
