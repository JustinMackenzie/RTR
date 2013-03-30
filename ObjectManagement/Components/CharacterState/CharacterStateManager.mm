//
//  CharacterStateManager.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "CharacterStateManager.h"
#import "Observer.h"
#import "CharacterStates.h"

@implementation CharacterStateManager

-(id)initWithGameObject:(GameObject *)gameObject
{
    self = [super initWithGameObject:gameObject Name:@"CharacterStateManager"];
    
    if(self)
    {
        _characterState = [[Moving alloc]init];
        _observers = [NSMutableArray new];
    }
    
    return self;
}

-(void)Attach:(Observer *)observer
{
    [_observers addObject:observer];
}

-(void)Notify
{
    for (Observer *observer in _observers)
    {
        [observer Update];
    }
}

-(NSString *)State
{
    return [_characterState State];
}

-(void)SetCharacterState:(id<CharacterState>)characterState
{
    if(_characterState)
    {
        [_characterState autorelease];
    }
    
    _characterState = [characterState retain];
    
    [self Notify];
}

-(void)Jump
{
    [_characterState Jump:self];
}

-(void)Done
{
    [_characterState Done:self];
}

-(void)dealloc
{
    [_characterState release];
    [_observers release];
    [super dealloc];
}

@end
