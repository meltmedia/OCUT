//
//  PermissionService.h
//  OCUT
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PermissionService : NSObject

- (BOOL)canAddGrape;
- (BOOL)canListGrape;
- (BOOL)canGetGrapes;

@end
