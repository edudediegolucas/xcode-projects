//
//  Country.m
//  Banderas
//
//  Created by Eduardo de Diego lucas on 4/8/15.
//  Copyright (c) 2015 Eduardo de Diego lucas. All rights reserved.
//

#import "Country.h"

@implementation Country

-(Country*)transformFromDictionary:(NSDictionary *)dic
{
    Country *c = [[Country alloc] init];
    c.name = [dic objectForKey:@"name"];
    c.capital = [dic objectForKey:@"capital"];
    c.picture = [dic objectForKey:@"picture"];
    
    return c;
}

@end
