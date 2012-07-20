//
//  JCViewController.m
//  JCGridMenu
//
//  Created by Joseph Carney on 20/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCViewController.h"

@interface JCViewController ()

@end

@implementation JCViewController

@synthesize scroll = _scroll;
@synthesize pageSelected = _pageSelected;
@synthesize pageControl = _pageControl;

@synthesize demo1 = _demo1;
@synthesize demo2 = _demo2;
@synthesize demo3 = _demo3;
@synthesize demo4 = _demo4;
@synthesize demo5 = _demo5;
@synthesize demo6 = _demo6;
@synthesize demoLoaded = _demoLoaded;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadScroll];
    [self loadDemos];
    [self loadDescriptions];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)loadScroll
{
    NSInteger pageCount = 7;
    _pageSelected = 0;
    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [_scroll setBackgroundColor:[UIColor clearColor]];
    [_scroll setPagingEnabled:YES];
    [_scroll setBounces:NO];
    [_scroll setScrollEnabled:YES];
    [_scroll setShowsHorizontalScrollIndicator:NO];
    [_scroll setShowsVerticalScrollIndicator:NO];
    [_scroll setDelegate:self];
    [_scroll setContentSize:CGSizeMake(320*pageCount, 480)];
    [self.view addSubview:_scroll];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 410, 320, 22)];
    [_pageControl setNumberOfPages:pageCount];
    [_pageControl setCurrentPage:0];
    [self.view addSubview:_pageControl];
}

- (void)loadDemos
{
    _demo1 = [[JCDemo1 alloc] init];
    [self.view addSubview:_demo1.view];
    
    _demo2 = [[JCDemo2 alloc] init];
    [self.view addSubview:_demo2.view];

    _demo3 = [[JCDemo3 alloc] init];
    [self.view addSubview:_demo3.view];
    
    _demo4 = [[JCDemo4 alloc] init];
    [self.view addSubview:_demo4.view];
    
    _demo5 = [[JCDemo5 alloc] init];
    [self.view addSubview:_demo5.view];
    
    _demo6 = [[JCDemo6 alloc] init];
    [self.view addSubview:_demo6.view];
    
    [self loadDemo:1];
}

- (void)loadDemo:(NSInteger)demo
{
    switch (_demoLoaded) {
        case 1:
            [_demo1 close];
            break;
        case 2:
            [_demo2 close];
            break;
        case 3:
            [_demo3 close];
            break;
        case 4:
            [_demo4 close];
            break;
        case 5:
            [_demo5 close];
            break;
        case 6:
            [_demo6 close];
            break;
    }
    
    switch (demo) {
        case 1:
            [_demo1 open];
            break;
        case 2:
            [_demo2 open];
            break;
        case 3:
            [_demo3 open];
            break;
        case 4:
            [_demo4 open];
            break;
        case 5:
            [_demo5 open];
            break;
        case 6:
            [_demo6 open];
            break;
    }
    
    _demoLoaded = demo;
}

- (void)loadDescriptions
{
    CGFloat top = 30;
    CGFloat left = 30;
    CGFloat width = 210;
    CGFloat height = 400;
    
    // Demo 1
    
    UILabel *title1 = [[UILabel alloc] 
                       demoTitle:@"Demo 1" 
                       frame:CGRectMake(left, top, width, height)];
    [_scroll addSubview:title1];

    UILabel *text1 = [[UILabel alloc] 
                      demoText:@"Here is a simple demo showing the control with 4 rows and no settings.\n\nA set of icons appear and you can tap them.\n\nTapping an icon selects and fades the others" 
                      frame:CGRectMake(left, top+40, width, height)];
    [_scroll addSubview:text1];
    
    
    // Demo 2
    
    left += 320;
    UILabel *title2 = [[UILabel alloc] demoTitle:@"Demo 2" frame:CGRectMake(left, top, width, height)];
    [_scroll addSubview:title2];

    UILabel *text2 = [[UILabel alloc] 
                      demoText:@"This demo uses only 1 row.\n\nThis row has 4 columns which are hidden until you tap it...\n\nGo on, tap it :)" 
                      frame:CGRectMake(left, top+40, width, height)];
    [_scroll addSubview:text2];

    // Demo 3
    
    left += 320;
    UILabel *title3 = [[UILabel alloc] demoTitle:@"Demo 3" frame:CGRectMake(left, top, width, height)];
    [_scroll addSubview:title3];
    
    UILabel *text3 = [[UILabel alloc] 
                      demoText:@"So far so good, but what if we want to add views?No problem...\n\nAs well as 44x44 buttons you can add your own views.\n\nTo make the options look more like buttons, you can style them too.\n\nWe can also help the user focus by fading and expanding non-selectable options" 
                      frame:CGRectMake(left, top+40, width, height)];
    [_scroll addSubview:text3];

    // Demo 4
    
    left += 320;
    UILabel *title4 = [[UILabel alloc] demoTitle:@"Demo 4" frame:CGRectMake(left, top, width, height)];
    [_scroll addSubview:title4];
    
    UILabel *text4 = [[UILabel alloc] 
                      demoText:@"But what about multiple selections?\n\nNo problem, drop those in as well.\n\nTap the favourites option and you can then multi select upto 3 favourites.\n\nNote the icon changes according to your selection..." 
                      frame:CGRectMake(left, top+40, width, height)];
    [_scroll addSubview:text4];
    
    // Demo 5
    
    left += 320;
    UILabel *title5 = [[UILabel alloc] demoTitle:@"Demo 5" frame:CGRectMake(left, top, width, height)];
    [_scroll addSubview:title5];
    
    UILabel *text5 = [[UILabel alloc] 
                      demoText:@"Starting to get a bit crowded now isn't it?\n\nYou can customise the control to keep your user focused on the task at hand.\n\nYou can also add more than one control to view..." 
                      frame:CGRectMake(left, top+40, width, height)];
    [_scroll addSubview:text5];

    
    // Demo 6
    
    left += 320;
    UILabel *title6 = [[UILabel alloc] demoTitle:@"Under the hood..." frame:CGRectMake(left, top, width, height)];
    [_scroll addSubview:title6];
    
    UILabel *text6 = [[UILabel alloc] 
                      demoText:@"The JCGridMenu works as a grid, loading and moving when required (tap the options).\n\nAs it works on UIViews & UIButtons, you can change the appearance completely, to suit your app." 
                      frame:CGRectMake(left, top+40, 260, height)];
    [_scroll addSubview:text6];

    // Demo 7
    
    left += 320;
    UILabel *text7 = [[UILabel alloc] 
                      demoText:@"I built this grid to solve a UI/UX problem in one of my apps.\n\nI'm releasing it because I think it could be useful to others.\n\nIt has it's limitations (only right alignment for starters) but it has solved my problem.\n\nI can offer no support or even guarantees that it will work inside your own project.\n\nFollow me on twitter @joseph_carney, and drop me a tweet sometime.\n\nI'd be interested to know what you think of this control and of any projects it appears in :)" 
                      frame:CGRectMake(left, top, 260, height)];
    [_scroll addSubview:text7];
    
    
}

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	NSInteger nearestNumber = lround(_scroll.contentOffset.x / _scroll.bounds.size.width) ;
	
	if (_pageControl.currentPage != nearestNumber) {
		_pageControl.currentPage = nearestNumber;
        _pageSelected = _pageControl.currentPage;
		if (_scroll.dragging) [_pageControl updateCurrentPageDisplay];
        [self loadDemo:_pageSelected+1];
	}
    
}


@end
