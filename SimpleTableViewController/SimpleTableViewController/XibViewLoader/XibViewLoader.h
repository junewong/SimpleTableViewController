//
//  XibViewLoader.h
//  youcoach
//
//  Created by June on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XibViewLoader : NSObject

+ (id)loadFistViewWithName:(NSString*)name owner:(id)owner;
+ (id)loadViewWithName:(NSString*)name owner:(id)owner atIndex:(int)index;
+ (id)loadFistViewWithName:(NSString*)name owner:(id)owner replaceView:(UIView*)replaceView;

@end
