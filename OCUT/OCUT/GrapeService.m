//
//  GrapeService.m
//  OCUT
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import "GrapeService.h"

@implementation GrapeService

- (id)init {
  
  if (self = [super init]) {
    _idToGrapeDict = [[NSMutableDictionary alloc] init];
  }
  
  return self;
}

- (NSArray*)getGrapes {
  
  NSMutableArray *myMutableGrapeArray = [[NSMutableArray alloc] init];
  
  for (id key in _idToGrapeDict) {
    id value = [_idToGrapeDict objectForKey:key];
    [myMutableGrapeArray addObject:value];
  }
  
  return [NSArray arrayWithArray:myMutableGrapeArray];
}

- (void)addGrape:(Grape*) grape {
  
  [_idToGrapeDict setObject:grape forKey:grape.ID];
  
}

- (Grape*)getGrape:(NSString*)ID {
  
  return (Grape*)[_idToGrapeDict objectForKey:ID];
  
}

@end
