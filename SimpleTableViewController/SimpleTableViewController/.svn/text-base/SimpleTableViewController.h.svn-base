//
//  SimpleTableViewController.h
//  SimpleTableViewController
//
//  Created by June on 13-4-27.
//  Copyright (c) 2013年 junewong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XibViewLoader.h"

typedef void(^SimpleTableViewCellBlock) (UITableViewCell *aCell, id data, NSIndexPath *indexPath);
typedef void(^SimpleTableViewSelectCellBlock) (id data, NSIndexPath *indexPath);
typedef NSString*(^SimpleTableViewSectionHeaderTitleBlock) (NSUInteger section);
typedef UIView*(^SimpleTableViewSectionHeaderViewBlock) (NSUInteger section);

@interface SimpleTableViewController : NSObject<UITableViewDataSource, UITableViewDelegate>
{
    SimpleTableViewCellBlock cellBlock;
    SimpleTableViewSelectCellBlock selectCellBlock;
    SimpleTableViewSectionHeaderTitleBlock sectionHeaderTitleBlock;
    SimpleTableViewSectionHeaderViewBlock sectionHeaderViewBlock;
    NSMutableArray *cellHeights;
}

@property (nonatomic, unsafe_unretained) UITableView *tableView;
@property (nonatomic) NSMutableArray *tableData; //当isGrouped为YES时，是二维数组；当为NO时时一维数组；
@property (nonatomic) NSString *cellClassName;
@property (nonatomic) BOOL autoDeselected;
@property (nonatomic) BOOL autoResizeCell;

// grouped
@property (nonatomic) BOOL isGrouped;

- (void)setCellBlock:(SimpleTableViewCellBlock)block;
- (void)setSelectCellBlock:(SimpleTableViewSelectCellBlock)block;
- (void)setSectionHeaderTitleBlock:(SimpleTableViewSectionHeaderTitleBlock)block;
- (void)setSectionHeaderViewBlock:(SimpleTableViewSectionHeaderViewBlock)block;

- (id)initWithTableView:(UITableView*)aTableView;
- (void)reloadData;

@end
