//
//  GameStateManager.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "GameStateManager.h"
#import "GameStates.h"
#import "Observer.h"
#import "GameStateObserver.h"

@implementation GameStateManager

-(id)init
{
    self = [super init];
    
    if(self)
    {
        _gameState = [[MainMenu alloc]init];
        _observers = [NSMutableArray new];
        [self Attach:[[[GameStateObserver alloc]initWithSubject:self] autorelease]];
        [self Notify];
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
    return [_gameState State];
}

-(void)SetGameState:(id<GameState>)gameState
{
    if(_gameState)
    {
        [_gameState autorelease];
    }
    
    _gameState = [gameState retain];
    
    [self Notify];
}

-(void)About
{
    [_gameState About:self];
}

-(void)Back
{
    [_gameState Back:self];
}

-(void)Settings
{
    [_gameState Settings:self];
}

-(void)How
{
    [_gameState How:self];
}

-(void)Play
{
    [_gameState Play:self];
}

-(void)Pause
{
    [_gameState Pause:self];
}

-(void)Restart
{
    [_gameState Restart:self];
}

-(void)Quit
{
    [_gameState Quit:self];
}

-(void)Done
{
    [_gameState Done:self];
}


@end
