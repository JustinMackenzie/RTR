//
//  GameObject.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-20.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "GameObject.h"
#import "Transform.h"

@implementation GameObject

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position
{
    self = [super init];
    
    if(self)
    {
        _tag = [tag copy];
        _components = [NSMutableDictionary new];
        
        [self AddComponent:[[[Transform alloc]initWithGameObject:self Position:position] autorelease]];
    }
    
    return self;
}

-(void)AddComponent:(Component *)component
{
    [_components setObject:component forKey:[component Name]];
}

-(void)RemoveComponent:(NSString *)name
{
    [_components removeObjectForKey:name];
}

-(Component *)GetComponent:(NSString *)name
{
    return [_components objectForKey:name];
}

-(NSArray *)GetAllComponents
{
    return [_components allValues];
}

-(NSString *)Tag
{
    return _tag;
}

-(void)dealloc
{
    [_components release];
    [_tag release];
    [super dealloc];
}

@end
