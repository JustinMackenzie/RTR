//
//  ObjectSystem.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "ObjectSystem.h"
#import "ObjectManager.h"
#import "ComponentManager.h"
#import "ObjectFactory.h"

@implementation ObjectSystem

static ObjectSystem *_sharedObjectSystem = nil;

+(id)alloc
{
    @synchronized([ObjectSystem class])
	{
		NSAssert(_sharedObjectSystem == nil, @"Attempted to allocate a second instance of an object system.");
		_sharedObjectSystem = [super alloc];
		return _sharedObjectSystem;
	}
    
	return nil;
}


-(id)init
{
    self = [super init];
    
    if(self)
    {
        _objectManager = nil;
        _componentManager = nil;
        _objectFactory = nil;
    }
    
    return self;
}


+(ObjectSystem *)SharedObjectSystem
{
    @synchronized([ObjectSystem class])
    {
        if(!_sharedObjectSystem)
        {
            [[self alloc]init];
        }
        
        return _sharedObjectSystem;
    }
}


-(GameObject *)AddObjectOfType:(NSString *)type At:(Vector2f *)position
{
    GameObject *result = nil;
    
    result = [_objectFactory CreateGameObjectOfType:type AtPosition:position];
    [_objectManager MarkObjectForAddition:result];
    
    for (Component *c in [result GetAllComponents])
    {
        [_componentManager MarkComponentForAddition:c];
    }
    
    return result;
}

-(NSMutableArray *)GetNewSprites
{
    return [_componentManager GetNewSprites];
}

-(NSMutableArray *)GetRemovedSprites
{
    return [_componentManager GetRemovedSprites];
}

-(void)update:(float)dt
{
    if(_objectManager)
        [_objectManager update:dt];
    
    if(_componentManager)
        [_componentManager update:dt];
}

-(void)RemoveObject:(GameObject *)object
{
    [_objectManager MarkObjectForRemoval:object];
    
    for (Component *component in [object GetAllComponents])
    {
        [_componentManager MarkComponentForRemoval:component];
    }
}

-(void)StartObjectSystem
{
    _objectManager = [[ObjectManager alloc]init];
    _componentManager = [[ComponentManager alloc]init];
    _objectFactory = [[ObjectFactory alloc]init];
}

-(GameObject *)AddPlatform:(int)size At:(Vector2f *)position
{
    GameObject *result = nil;
    
    result = [_objectFactory AddPlatform:size At:position];
    
    [_objectManager MarkObjectForAddition:result];
    
    for (Component *c in [result GetAllComponents])
    {
        [_componentManager MarkComponentForAddition:c];
    }
    
    return result;
}

-(void)ClearObjectSystem
{
    if(_objectManager)
    {
        [_objectManager release];
        _objectManager = nil;
    }
    
    if(_componentManager)
    {
        [_componentManager release];
        _componentManager = nil;
    }
    
    if(_objectFactory)
    {
        [_objectFactory release];
        _objectManager = nil;
    }
}

-(NSMutableArray *)GetObjects:(NSString *)type
{
    return [_objectManager GetObjects:type];
}

-(GameObject *)GetTubby
{
    return [_objectManager GetTubby];
}

-(void)dealloc
{
    if(_objectManager)
        [_objectManager release];
    
    if(_componentManager)
        [_componentManager release];
    
    if(_objectFactory)
        [_objectFactory release];
    
    [super dealloc];
}

@end
