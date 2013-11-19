//
//  XibViewLoader.m
//  youcoach
//
//  Created by June on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "XibViewLoader.h"

@implementation XibViewLoader

+ (id)loadFistViewWithName:(NSString*)name owner:(id)owner
{
	return [XibViewLoader loadViewWithName:name owner:owner atIndex:0];
}

+ (id)loadViewWithName:(NSString*)name owner:(id)owner atIndex:(int)index
{
	return [[[NSBundle mainBundle] loadNibNamed:name owner:owner options:nil] objectAtIndex:index];
}

+ (id)loadFistViewWithName:(NSString*)name owner:(id)owner replaceView:(UIView*)replaceView
{
    UIView *xibView = [[self class] loadFistViewWithName:name owner:owner];
    
    xibView.autoresizingMask = replaceView.autoresizingMask;
    
    UIView *parentView = replaceView.superview;
    CGRect rect = replaceView.frame;
    
    [replaceView removeFromSuperview];
    replaceView = nil;
    
    xibView.frame = rect;
    
    [parentView addSubview:xibView];
    
    replaceView = xibView;
    
    return xibView;
}

@end
