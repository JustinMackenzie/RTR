//
//  ObjectManager.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "ObjectManager.h"
#import "GameObject.h"
#import "Queue.h"
#import "Health.h"
#import "Tubby.h"
#import "Transform.h"
#import "Vector2f.h"

@implementation ObjectManager

-(id)init
{
    self = [super init];
    
    if(self)
    {
        _gameObjects = [NSMutableDictionary new];
        _allGameObjects = [NSMutableArray new];
        _addQueue = [[Queue alloc]init];
        _removeQueue = [[Queue alloc]init];
        _tubby = nil;
    }
    
    return self;
}

-(void)MarkObjectForAddition:(GameObject *)object
{
    [_addQueue enqueue:object];
}

-(void)AddGameObject:(GameObject *)object
{
    NSMutableArray *gameObjects = [_gameObjects valueForKey:[object Tag]];
    
    if(gameObjects == nil)
    {
        gameObjects = [NSMutableArray new];
        [gameObjects addObject: object];
        [_gameObjects setValue:[gameObjects autorelease] forKey:[object Tag]];
    }
    else
    {
        [gameObjects addObject:object];
    }
    
    [_allGameObjects addObject:object];
    
    if([[object Tag] isEqualToString:@"Tubby"])
    {
        _tubby = [(Tubby *)object retain];
    }
}

-(void)MarkObjectForRemoval:(GameObject *)object
{
    [_removeQueue enqueue:object];
}

-(void)RemoveGameObject:(GameObject *)object
{
    [[_gameObjects objectForKey:[object Tag]] removeObject:object];
    [_allGameObjects removeObject:object];
    
    if([[object Tag] isEqualToString:@"Tubby"])
    {
        [_tubby release];
        _tubby = nil;
    }
}

-(void)update:(float)dt
{
    while (![_addQueue isEmpty])
    {
        [self AddGameObject:[_addQueue dequeue]];
    }
    
    while (![_removeQueue isEmpty])
    {
        [self RemoveGameObject:[_removeQueue dequeue]];
    }
    
    float position = nil;
    
    if(_tubby)
    {
        position =  [[(Transform *)[_tubby GetComponent:@"Transform"] Position] Y];
        if([[(Transform *)[_tubby GetComponent:@"Transform"] Position] Y] < -1)
        {
            [(Health *)[_tubby GetComponent:@"Health"] Kill];
        }
    }
}

-(NSMutableArray *)GetObjects:(NSString *)type
{
    return [_gameObjects objectForKey:type];
}

-(GameObject *)GetTubby
{
    return _tubby;
}

-(void)dealloc
{
    [_gameObjects release];
    [_allGameObjects release];
    [_addQueue release];
    
    if(_tubby)
    {
        [_tubby release];
    }
    
    [_removeQueue release];
    
    [super dealloc];
}

@end
