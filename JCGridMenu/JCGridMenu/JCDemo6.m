//
//  JCDemo6.m
//  JCGridMenu
//
//  Created by Joseph Carney on 20/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCDemo6.h"

@interface JCDemo6 ()

@end

@implementation JCDemo6

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
        NSLog(@"init demo2");

        // Favourites
        
        JCGridMenuColumn *favouriteView = [[JCGridMenuColumn alloc] 
                                           initWithButtonImageTextLeft:CGRectMake(0, 0, 76, 44) 
                                           image:@"FavouriteSmall" 
                                           selected:@"FavouriteSmallSelected" 
                                           text:@"Event"];
        [favouriteView.button setBackgroundColor:[UIColor blackColor]];
        [favouriteView setCloseOnSelect:NO];
        
        JCGridMenuColumn *favouriteObject = [[JCGridMenuColumn alloc] 
                                             initWithButtonImageTextLeft:CGRectMake(0, 0, 80, 44) 
                                             image:@"FavouriteSmall" 
                                             selected:@"FavouriteSmallSelected" 
                                             text:@"Object"];
        [favouriteObject.button setBackgroundColor:[UIColor blackColor]];
        [favouriteObject setCloseOnSelect:NO];
        
        JCGridMenuRow *favourites = [[JCGridMenuRow alloc] 
                                     initWithImages:@"Favourite" 
                                     selected:@"FavouriteSelected" 
                                     highlighted:@"FavouriteSelected" 
                                     disabled:@"Favourite"];
        [favourites setColumns:[[NSMutableArray alloc] initWithObjects:favouriteView, favouriteObject, nil]];
        [favourites setIsExpanded:NO];
        [favourites setIsModal:YES];
        [favourites setHideAlpha:0.8f];
        [favourites.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.4f]];
        
        
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
        
        JCGridMenuRow *share = [[JCGridMenuRow alloc] initWithImages:@"Share" selected:@"ShareSelected" highlighted:@"ShareSelected" disabled:@"Share"];
        [share setColumns:[[NSMutableArray alloc] initWithObjects:pocket, twitter, facebook, email, nil]];
        [share setIsModal:YES];
        [share.button setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.4f]];
        
        
        // Comments
        
        JCGridMenuRow *comments = [[JCGridMenuRow alloc] initWithImages:@"Comments" selected:@"CommentsSelected" highlighted:@"CommentsSelected" disabled:@"Comments"];
        [comments setHideAlpha:0.1f];
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
        
        NSArray *rows = [[NSArray alloc] initWithObjects:favourites, share, comments, spam, nil];
        _gmDemo = [[JCGridMenuController alloc] initWithFrame:CGRectMake(0,200,240,(44*[rows count])+[rows count]) rows:rows tag:GM_TAG];
        [_gmDemo setDelegate:self];
        [_gmDemo.view setClipsToBounds:NO];
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
    NSLog(@"jcGridMenuRowSelected");
    
    if (indexTag==GM_TAG) {
        JCGridMenuRow *rowSelected = (JCGridMenuRow *)[_gmDemo.rows objectAtIndex:indexRow];
        [[rowSelected button] setSelected:![rowSelected button].selected];
    }
    
}

- (void)jcGridMenuColumnSelected:(NSInteger)indexTag indexRow:(NSInteger)indexRow indexColumn:(NSInteger)indexColumn
{
    NSLog(@"jcGridMenuColumnSelected");
    
    if (indexTag==GM_TAG) {
        
        if (indexRow==0) {
            // Favourites
            UIButton *selected = (UIButton *)[[[_gmDemo.gridCells objectAtIndex:indexRow] buttons] objectAtIndex:indexColumn];
            [selected setSelected:![selected isSelected]];
            BOOL hasSelected = NO;
            
            for (int i=0; i<[[[_gmDemo.gridCells objectAtIndex:indexRow] buttons] count]; i++) {
                
                if ([[[[_gmDemo.gridCells objectAtIndex:indexRow] buttons] objectAtIndex:i] isSelected]) {
                    hasSelected = YES;
                    break;
                }
                
            }
            
            [[[_gmDemo.gridCells objectAtIndex:indexRow] button] setSelected:hasSelected];
        } else if (indexRow==2) {
            [[[_gmDemo.gridCells objectAtIndex:indexRow] button] setSelected:NO];
        }
        
        [_gmDemo setIsRowModal:NO];
    }
    
}


@end
