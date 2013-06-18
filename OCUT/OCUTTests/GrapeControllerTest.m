//
//  GrapeControllerTest.m
//  GrapeControllerTest
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import "GrapeControllerTest.h"
#import "Grape.h"
#import "GrapeViewController.h"
#import <OCMock/OCMock.h>


@implementation GrapeControllerTest

/**
 * Utility grape creator
 */
- (Grape*)createGrapeWithID:(NSString *)ID andWrangled:(BOOL)wrangled {
  
  Grape* testGrape = [[Grape alloc] init];
  [testGrape setID:ID];
  [testGrape setWrangled:wrangled];
  return testGrape;
  
}

- (void)testAddGrape {
  
  id mockGrapeService = [OCMockObject mockForClass:[GrapeService class]];
  id mockPermissionService = [OCMockObject mockForClass:[PermissionService class]];
  
  GrapeViewController* grapeViewController = [[GrapeViewController alloc] initWithGrapeService:mockGrapeService andPermissionService:mockPermissionService];
  Grape* testGrape = [self createGrapeWithID:@"1" andWrangled:NO];
  Grape* responseGrape = [self createGrapeWithID:@"2" andWrangled:YES];
  
  [[[mockPermissionService stub] andReturnValue:OCMOCK_VALUE((BOOL){YES})] canAddGrape];
  [[[mockGrapeService stub] andReturn:responseGrape] addGrape:testGrape];
  
  Grape* grape = [grapeViewController add:testGrape];
  
  [mockGrapeService verify];
  [mockPermissionService verify];
  
  STAssertEqualObjects(responseGrape, grape, @"Grapes are not equal");
  
}

- (void)testListGrapes {
  
  id mockGrapeService = [OCMockObject mockForClass:[GrapeService class]];
  id mockPermissionService = [OCMockObject mockForClass:[PermissionService class]];
  NSArray* mockGrapeArray = [[NSArray alloc] init];
  
  [[[mockPermissionService stub] andReturnValue:OCMOCK_VALUE((BOOL){YES})] canListGrape];
  [[[mockGrapeService stub] andReturn:mockGrapeArray] getGrapes];
  
  GrapeViewController* grapeViewController = [[GrapeViewController alloc] initWithGrapeService:mockGrapeService andPermissionService:mockPermissionService];
  
  NSArray* grapeArray = [grapeViewController list];
  
  [mockGrapeService verify];
  [mockPermissionService verify];
  
  STAssertEqualObjects(mockGrapeArray, grapeArray, @"Arrays are not equivalent.");

}

- (void)testGetGrapes {
  
  NSString* GRAPE_ID = @"1";
  id mockGrapeService = [OCMockObject mockForClass:[GrapeService class]];
  id mockPermissionService = [OCMockObject mockForClass:[PermissionService class]];
  Grape* mockGrape = [self createGrapeWithID:GRAPE_ID andWrangled:NO];
  
  [[[mockPermissionService stub] andReturnValue:OCMOCK_VALUE((BOOL){YES})] canGetGrapes];
  [[[mockGrapeService stub] andReturn:mockGrape] getGrape:GRAPE_ID];
  
  GrapeViewController* grapeViewController = [[GrapeViewController alloc] initWithGrapeService:mockGrapeService andPermissionService:mockPermissionService];
  
  Grape* gotGrape = [grapeViewController get:GRAPE_ID];
  
  [mockGrapeService verify];
  [mockPermissionService verify];
  
  STAssertEqualObjects(mockGrape, gotGrape, @"Grapes are not equivalent.");
  
}


@end