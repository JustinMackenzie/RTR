//
//  Component.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Component.h"

@implementation Component

-(id)initWithGameObject:(GameObject *)gameObject Name:(NSString *)name
{
    self = [super init];
    
    if(self)
    {
        _gameObject = [gameObject retain];
        _name = [name copy];
    }
    
    return self;
}

-(GameObject *)GameObject
{
    return _gameObject;
}

-(NSString *)Name
{
    return _name;
}

-(void)dealloc
{
    [_gameObject release];
    [_name release];
    [super dealloc];
}

@end
