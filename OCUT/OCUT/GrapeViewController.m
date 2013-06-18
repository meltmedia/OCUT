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
      _grapeService = [[GrapeService alloc] init];
      _permissionService = [[PermissionService alloc] init];
      
    }
    return self;
}

- (id)init {
  
  return [self initWithGrapeService:[[GrapeService alloc] init] andPermissionService:[[PermissionService alloc] init]];
  
}

- (id)initWithGrapeService:(GrapeService *)grapeService andPermissionService:(PermissionService *)permissionService {
  
  if (self = [super init]) {
    _grapeService = grapeService;
    _permissionService = permissionService;
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
  [_permissionService canListGrape];
  return [_grapeService getGrapes];
}

- (Grape*)get:(NSString*)ID {
  [_permissionService canGetGrapes];
  return [_grapeService getGrape:ID];
}

- (Grape*)add:(Grape*)grape {
  [_permissionService canAddGrape];
  return [_grapeService addGrape:grape];
}

@end
