//
//  Grape.h
//  OCUT
//
//  Created by Jake Heun on 6/17/13.
//  Copyright (c) 2013 meltmedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grape : NSObject {
  NSString* _ID;
  BOOL _wrangled;
}

@property (nonatomic, retain) NSString* ID;
@property (nonatomic, assign) BOOL wrangled;

- (NSString*)toString;


@end
