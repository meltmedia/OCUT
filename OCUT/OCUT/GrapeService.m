//
//  GrapeService.m
//  OCUT
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import "GrapeService.h"

@implementation GrapeService

+ (NSMutableDictionary*)idToGrapeDict {
  
  static NSMutableDictionary *_idToGrapeDict = nil;
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
  
    _idToGrapeDict = [[NSMutableDictionary alloc] init];
    
  });
  
  return _idToGrapeDict;
  
}

- (NSArray*)getGrapes {
  
  NSMutableArray *myMutableGrapeArray = [[NSMutableArray alloc] init];
  
  for (id key in [GrapeService idToGrapeDict]) {
    id value = [[GrapeService idToGrapeDict] objectForKey:key];
    [myMutableGrapeArray addObject:value];
  }
  
  return [NSArray arrayWithArray:myMutableGrapeArray];
}

- (void)addGrape:(Grape*) grape {
  
  [(NSMutableDictionary*)[GrapeService idToGrapeDict] setObject:grape forKey:grape.ID];
  
}

- (Grape*)getGrape:(NSString*)ID {
  
  return (Grape*)[(NSMutableDictionary*)[GrapeService idToGrapeDict] objectForKey:ID];
  
}

@end
