//
//  PropertyList.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "PropertyList.h"

@implementation PropertyList

-(id)initWithName:(NSString *)name AndContents:(NSDictionary *)contents
{
    self = [super init];
    
    if(self)
    {
        _name = [name copy];
        _contents = [contents retain];
    }
    
    return self;
}

/* Returns the contents of this property list. */
-(NSDictionary *)getContents
{
    return _contents;
}

/* Returns the row of the property list with the given key. */
-(id)getRowWithKey:(id)key
{
    return [_contents objectForKey:key];
}

-(void)dealloc
{
    [_name release];
    [_contents release];
    [super dealloc];
}

@end
