//
//  Country.h
//  Banderas
//
//  Created by Eduardo de Diego lucas on 4/8/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *capital;
@property(strong, nonatomic) NSString *picture;

-(Country*)transformFromDictionary:(NSDictionary*)dic;

@end
