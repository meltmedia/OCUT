//
//  BigUnitTest.m
//  BigUnitTest
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import "BigUnitTest.h"
#import "Grape.h"
#import "GrapeViewController.h"

@implementation BigUnitTest

/**
 * Utility grape creator
 */
- (Grape*)createGrapeWithID:(NSString *)ID andWrangled:(BOOL)wrangled {
  
  Grape* testGrape = [[Grape alloc] init];
  [testGrape setID:ID];
  [testGrape setWrangled:wrangled];
  return testGrape;
  
}

- (void)testController {
  NSUInteger EXPECTED_SIZE = 10;
  
  GrapeViewController *grapeViewController = [[GrapeViewController alloc] init];
  
  NSArray *emptyArray = [grapeViewController list];
  
  STAssertEquals((NSUInteger)0, emptyArray.count, @"Grapes not initially empty.");
  
  Grape* testGrape = [self createGrapeWithID:@"-1" andWrangled:NO];
  [grapeViewController add:testGrape];
  Grape* gotGrape = [grapeViewController get:@"-1"];
  
  STAssertEqualObjects(testGrape, gotGrape, @"Grapes are not equal");
  
  for (int index = 1; index < EXPECTED_SIZE; index++) {
    [grapeViewController add:[self createGrapeWithID:[NSString stringWithFormat:@"%c", index] andWrangled:NO]];
  }
  
  STAssertEquals(EXPECTED_SIZE, [[grapeViewController list] count], @"Not the right amount of grapes");
  
}


@end