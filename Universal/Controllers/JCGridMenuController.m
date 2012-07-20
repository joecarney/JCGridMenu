//
//  JCGridMenuController.m
//
//  Created by Joseph Carney on 13/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import "JCGridMenuController.h"

@interface JCGridMenuController ()

@end

@implementation JCGridMenuController

@synthesize delegate = _delegate;
@synthesize rows = _rows;
@synthesize rowsReset = _rowsReset;
@synthesize gridCells = _gridCells;
@synthesize rowSelected = _rowSelected;
@synthesize isRowModal = _isRowModal;
@synthesize tag = _tag;

- (id)initWithFrame:(CGRect)frame rows:(NSArray *)initRows tag:(NSInteger)initTag
{
    self = [super init];
    
    if (self) {
        _tag = initTag;
        _rowsReset = [[NSMutableArray alloc] initWithArray:initRows];
        frame.size.height = frame.size.height +44;
        frame.origin.y = frame.origin.y -22;
        [self setView:[[JCUIViewTransparent alloc] initWithFrame:frame]];
        [self.view setClipsToBounds:YES];
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

#pragma mark - Open and Close

- (void)open
{
    [self closeRemoveExisting];
    _rowSelected = -1;
    _isRowModal = NO;
    _gridCells = [[NSMutableArray alloc] init];
    _rows = [[NSMutableArray alloc] initWithArray:_rowsReset];
    
    for (int i=0; i<[_rows count]; i++) {
        JCGridMenuRow *option = (JCGridMenuRow *)[_rows objectAtIndex:i];
        JCGridMenuView *menuOption = [[JCGridMenuView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width+88, 44)];
        [menuOption setDelegate:self];
        [menuOption setBackgroundColor:[UIColor clearColor]];
        [menuOption setRowOrder:i];
        [menuOption setRow:option];
        [menuOption setButton:[option button]];
        [menuOption setIsExpanded:[option isExpanded]];
        [_gridCells addObject:menuOption];
    }
    
    NSTimeInterval delay = 0;
    
    for (int i=0; i<[_gridCells count]; i++) {
        [[_gridCells objectAtIndex:i] setAlpha:1.0];
        [[_gridCells objectAtIndex:i] setFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width+88, 44)];
        [self.view addSubview:[_gridCells objectAtIndex:i]];
        [[_gridCells objectAtIndex:i] performSelector:@selector(show) withObject:nil afterDelay:delay];
        delay += 0.1;
    }
        
}

- (void)close
{
    NSTimeInterval delay = 0;
    
    for (int i=0; i<[_rows count]; i++) {
        [[_gridCells objectAtIndex:i] reset];
        [[_gridCells objectAtIndex:i] hide];
        delay += 0.4;
    }

}

- (void)closeRemoveExisting
{
    NSArray *viewsAll = [self.view subviews];
    
    for (JCGridMenuView *viewRemove in viewsAll) {
        [viewRemove clear];
        [viewRemove removeFromSuperview];
    }

}

#pragma mark - Expand and collapse

- (void)expand:(NSInteger)row
{
    _rowSelected = -1;
    [self jcGridMenuViewRowSelected:row];
}

- (void)collapse:(NSInteger)row
{
    _rowSelected = row;
    [self jcGridMenuViewColumnSelected:row];
}

#pragma mark - jcGridMenuViewDelegate

- (void)jcGridMenuViewRowSelected:(NSInteger)indexRow
{
    //NSLog(@"jcGridMenuViewRowSelected %i", _tag);
    
    if (_rowSelected == indexRow) {
        
        if ([self.delegate respondsToSelector:@selector(jcGridMenuRowSelected:indexRow:isExpand:)]) {
            [self.delegate jcGridMenuRowSelected:_tag indexRow:indexRow isExpand:NO];
            
            for (int i=0; i<[_rows count]; i++) {
                [[_gridCells objectAtIndex:i] collapse:indexRow];
                [[_gridCells objectAtIndex:i] setAlpha:1.0];
            }
            
            _rowSelected = -1;
            _isRowModal = NO;
        }
        
    } else {

        if (! _isRowModal) {
        
            if ([self.delegate respondsToSelector:@selector(jcGridMenuRowSelected:indexRow:isExpand:)]) {
                [self.delegate jcGridMenuRowSelected:_tag indexRow:indexRow isExpand:YES];
                _isRowModal = [[_rows objectAtIndex:indexRow] isModal];
                
                BOOL isSeperate = NO;
                JCGridMenuRow *selected = [_rows objectAtIndex:indexRow];
                
                for (int i=0; i<[_rows count]; i++) {
                    [[_gridCells objectAtIndex:i] collapse:i];
                    [[_gridCells objectAtIndex:i] setAlpha:1.0];
                    
                    if (i==indexRow) {
                        [[_gridCells objectAtIndex:i] expand:indexRow];
                        [self.view bringSubviewToFront:[_gridCells objectAtIndex:i]];
                        isSeperate = YES;
                    } else {
                        [[_gridCells objectAtIndex:i] setAlpha:[[_rows objectAtIndex:indexRow] hideAlpha]];
                    }
                    
                }
                
                if (! selected.isSeperated) {
                    isSeperate = NO;
                }
                
                if (isSeperate) {
                    
                    for (int i=0; i<[_rows count]; i++) {
                        
                        if (i==indexRow) {
                        } else {
                            
                            if (i<indexRow) {
                                [[_gridCells objectAtIndex:i] seperate:NO];
                            } else {
                                [[_gridCells objectAtIndex:i] seperate:YES];
                            }
                            
                        }
                        
                    }
                    
                }
                
                _rowSelected = indexRow;
            }
            
        }
            
    }
    
}

- (void)jcGridMenuViewColumnSelected:(NSInteger)indexColumn
{
    //NSLog(@"jcGridMenuViewColumnSelected %i", _tag);
    
    if ([self.delegate respondsToSelector:@selector(jcGridMenuColumnSelected:indexRow:indexColumn:)]) {
        NSInteger columnInRow = indexColumn - ((_rowSelected+1) * 100);
        JCGridMenuRow *rowSelected = (JCGridMenuRow *)[_rows objectAtIndex:_rowSelected];
        JCGridMenuColumn *columnSelected = (JCGridMenuColumn *)[rowSelected.columns objectAtIndex:columnInRow];
        [self.delegate jcGridMenuColumnSelected:_tag indexRow:_rowSelected indexColumn:columnInRow];
        
        if ([columnSelected closeOnSelect]) {
            
            for (int i=0; i<[_rows count]; i++) {
                
                if ([[_gridCells objectAtIndex:i] isExpanded]) {
                    [[_gridCells objectAtIndex:i] collapse:indexColumn];
                } else {
                    [[_gridCells objectAtIndex:i] reset];
                }
                
                [[_gridCells objectAtIndex:i] setAlpha:1.0];
            }
            
            _rowSelected = -1;
        }
    }
    
}

@end
