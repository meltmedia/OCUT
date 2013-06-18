//
//  GrapeService.h
//  OCUT
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grape.h"

@interface GrapeService : NSObject {
  NSMutableDictionary *_idToGrapeDict;
}

- (NSArray*)getGrapes;

- (void)addGrape:(Grape*) grape;

- (Grape*)getGrape:(NSString*)ID;


@end
