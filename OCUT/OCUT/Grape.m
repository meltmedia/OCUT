//
//  Grape.m
//  OCUT
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import "Grape.h"

@implementation Grape

@synthesize wrangled = _wrangled, ID = _ID;

- (NSString *)toString {
  return [NSString stringWithFormat:@"ID: %@ Wrangled: %c", _ID, _wrangled];
}

@end
