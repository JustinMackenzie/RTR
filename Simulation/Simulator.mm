//
//  Simulator.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-20.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Simulator.h"
#import "CommandManager.h"
#import "GameStateManager.h"
#import "InputManager.h"
#import "GameStateObserver.h"
#import "PhysicsManager.h"
#import "SessionManager.h"
#import "cocos2d.h"
#import "ObjectSystem.h"
#import "InterfaceManager.h"

@implementation Simulator

static Simulator *_sharedSimulator = nil;

+(Simulator *)SharedSimulator;
{
    @synchronized([Simulator class])
    {
        if(!_sharedSimulator)
        {
            [[self alloc]init];
        }
        
        return _sharedSimulator;
    }
}

+(id)alloc
{
    @synchronized([Simulator class])
	{
		NSAssert(_sharedSimulator == nil, @"Attempted to allocate a second instance of a simulator.");
		_sharedSimulator = [super alloc];
		return _sharedSimulator;
	}
    
	return nil;
}

-(id)init
{
    self = [super init];
    
    if(self)
    {
        _commandManager = [[CommandManager alloc]init];
        _gameStateManager = [[GameStateManager alloc]init];
        _inputHandler = [[InputManager alloc]initWithCommandManager:_commandManager GameStateManager:_gameStateManager];
        _physicsManager = [[PhysicsManager alloc]init];
        _sessionManager = nil;
        _difficulty = @"Easy";
    }
    
    return self;
}


-(id<InputHandler>)getInputHandler
{
    return _inputHandler;
}

-(b2World *)GetWorld
{
    return [_physicsManager getWorld];
}

-(void)StartGame
{
    [[ObjectSystem SharedObjectSystem] StartObjectSystem];
    _sessionManager = [[SessionManager alloc]initWithGameStateManager:_gameStateManager];
    [_sessionManager StartGame];
}

-(void)StopGame
{
    [[ObjectSystem SharedObjectSystem] ClearObjectSystem];
    [_sessionManager release];
    _sessionManager = nil;
}

-(SessionManager *)getSessionManager
{
    return _sessionManager;
}

-(NSString *)GameState
{
    return [_gameStateManager State];
}

-(void)update:(float)dt
{
    [_commandManager update:dt];
    
    if(![[_gameStateManager State] isEqualToString:@"Paused"] && ![[_gameStateManager State]isEqualToString:@"GameOver"])
    {
        [_physicsManager update:dt];
        [[ObjectSystem SharedObjectSystem] update:dt];
        if(_sessionManager)
            [_sessionManager update:dt];
        [[InterfaceManager SharedInterfaceManager] update:dt];
    }
}

-(NSString *)Difficulty
{
    return _difficulty;
}

-(void)SetDifficulty:(NSString *)difficulty
{
    _difficulty = difficulty;
}

-(void)dealloc
{
    [_commandManager release];
    [_gameStateManager release];
    [_inputHandler release];
    [_physicsManager release];
    if(_sessionManager)
        [_sessionManager release];
    [super dealloc];
}

@end
