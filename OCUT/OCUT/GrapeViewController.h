//
//  GrapeViewController.h
//  OCUT
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GrapeService.h"
#import "PermissionService.h"

@interface GrapeViewController : UIViewController {
  
  GrapeService *grapeService;
  PermissionService *permissionService;
  
}

- (NSArray*)list;
- (Grape*)get:(NSString*)ID;
- (Grape*)add:(Grape*)grape;

@end
