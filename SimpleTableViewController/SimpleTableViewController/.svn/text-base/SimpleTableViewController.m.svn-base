//
//  SimpleTableViewController.m
//  SimpleTableViewController
//
//  Created by June on 13-4-27.
//  Copyright (c) 2013年 junewong. All rights reserved.
//

#import "SimpleTableViewController.h"

@implementation SimpleTableViewController

@synthesize tableView;
@synthesize tableData;
@synthesize cellClassName;
@synthesize autoDeselected;
@synthesize isGrouped;

- (id)initWithTableView:(UITableView*)aTableView
{
    self = [super init];
    if (self) {
        self.tableView = aTableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self _init];
    }
    return self;
}

- (void)_init
{
    self.tableData = [NSMutableArray array];
    self.isGrouped = NO;
    self.autoDeselected = YES;
    self.autoResizeCell = NO;
}

- (void)setIsGrouped:(BOOL)value
{
    isGrouped = value;
    
    self.tableView.sectionHeaderHeight = !isGrouped ? 0 : 22; //default
}

#pragma mark - block

- (void)setCellBlock:(SimpleTableViewCellBlock)block
{
    cellBlock = block;
}

- (void)setSelectCellBlock:(SimpleTableViewSelectCellBlock)block
{
    selectCellBlock = block;
}

- (void)setSectionHeaderTitleBlock:(SimpleTableViewSectionHeaderTitleBlock)block
{
    sectionHeaderTitleBlock = block;
}

- (void)setSectionHeaderViewBlock:(SimpleTableViewSectionHeaderViewBlock)block
{
    sectionHeaderViewBlock = block;
}

#pragma mark - public methods

- (void)reloadData
{
    if (self.autoResizeCell) {
        // 延迟刷新以让表格重新计算不同的单元格高度
        [self.tableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.1];
    } else {
        [self.tableView reloadData];
    }
}

#pragma mark - table delegate

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isGrouped) {
        return [[self.tableData objectAtIndex:section] count];
    }
    return [self.tableData count];
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.isGrouped) {
        return [self.tableData count];
    }
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellClassName == nil) {
        return nil;
    }
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"%@Identifier", self.cellClassName];
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [XibViewLoader loadFistViewWithName:self.cellClassName owner:self];
    }
    
    id data = [self getDataWithIndexPath:indexPath];
    
    if (cellBlock) {
        cellBlock(cell, data, indexPath);
    }
    
    // keep cell height if need:
    if (self.autoResizeCell == YES) {
        
        if (cellHeights == nil) {
            cellHeights = [NSMutableArray arrayWithCapacity:[self.tableData count]];
        }
        
        CGFloat height = cell.frame.size.height;
        
        if (indexPath.row < [cellHeights count]) {
            [cellHeights replaceObjectAtIndex:indexPath.row withObject:@(height)];
            
        } else {
            [cellHeights addObject:@(height)];
        }
    }
    
    return cell;
}

- (id)getDataWithIndexPath:(NSIndexPath*)indexPath
{
    if (self.isGrouped) {
        return [[self.tableData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    return [self.tableData objectAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id data = [self.tableData objectAtIndex:indexPath.row];
    
    if (selectCellBlock) {
        selectCellBlock(data, indexPath);
    }
    
    if (self.autoDeselected) {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.autoResizeCell) {
        CGFloat height = [[cellHeights objectAtIndex:indexPath.row] floatValue];
        return height;
    }
    return self.tableView.rowHeight;
}

#pragma mark - grouped

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (sectionHeaderTitleBlock == nil) {
        return nil;
    }
    
    return sectionHeaderTitleBlock(section);
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (sectionHeaderViewBlock == nil) {
        return nil;
    }
    
    return sectionHeaderViewBlock(section);
}


@end
