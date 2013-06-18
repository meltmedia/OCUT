//
//  GrapeViewController.m
//  OCUT
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import "GrapeViewController.h"

@interface GrapeViewController ()

@end

@implementation GrapeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
      // Initialize out services
      grapeService = [[GrapeService alloc] init];
      permissionService = [[PermissionService alloc] init];
      
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSArray*)list {
  [permissionService canListGrape];
  return [grapeService getGrapes];
}

- (Grape*)get:(NSString*)ID {
  [permissionService canGetGrapes];
  return [grapeService getGrape:ID];
}

- (Grape*)add:(Grape*)grape {
  [permissionService canAddGrape];
  [grapeService addGrape:grape];
  return grape;
}

@end
