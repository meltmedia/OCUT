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
  
  GrapeViewController* grapeViewController = [[GrapeViewController alloc] init];
  Grape* testGrape = [self createGrapeWithID:@"1" andWrangled:NO];
  Grape* grape = [grapeViewController add:testGrape];
  
  STAssertEqualObjects(testGrape, grape, @"Grapes are not equal");
  
}

- (void)testListGrapes {
  
  NSUInteger EXPECTED_SIZE = 10;
  GrapeViewController* grapeViewController = [[GrapeViewController alloc] init];
  NSArray* emptyArray = [grapeViewController list];
  
  STAssertEquals((NSUInteger)0, emptyArray.count, @"Grapes is not initially empty.");
  
  for (int index = 0; index < EXPECTED_SIZE; index++) {
    [grapeViewController add:[self createGrapeWithID:[NSString stringWithFormat:@"%c", index] andWrangled:NO]];
  }
  
  STAssertEquals(EXPECTED_SIZE, grapeViewController.list.count, @"Incorrect number of grapes.");

}

- (void)testGetGrapes {
  
  NSString* GRAPE_ID = @"4";
  BOOL GRAPE_WRANGLED = NO;
  
  GrapeViewController* grapeViewController = [[GrapeViewController alloc] init];
  [grapeViewController add:[self createGrapeWithID:GRAPE_ID andWrangled:GRAPE_WRANGLED]];
  
  Grape* testGrape = [grapeViewController get:GRAPE_ID];
  
  STAssertEqualObjects(GRAPE_ID, testGrape.ID, @"Grape ID's do not match.");
  STAssertEquals(GRAPE_WRANGLED, testGrape.wrangled, @"Grape is improperly wrangled.");
  
}


@end