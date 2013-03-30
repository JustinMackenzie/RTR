//
//  GameStateObserver.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "GameStateObserver.h"
#import "InterfaceManager.h"
#import "Simulator.h"
#import "GameStateManager.h"
#import "SimpleAudioEngine.h"

@implementation GameStateObserver

-(id)initWithSubject:(id<Observable>)subject
{
    self = [super initWithSubject:subject];
    
    if(self)
    {
        _currentState = nil;
    }
    
    return self;
}

-(void)Update
{
    NSString *newState = [_subject State];
    
    if([newState isEqualToString:@"GameOver"])
    {
        [[SimpleAudioEngine sharedEngine] playEffect:@"gameover1.wav"];
    }
    
    if([newState isEqualToString:@"GameStarting"])
    {
        // Game was restarted.
        if([_currentState isEqualToString:@"GameSession"] || [_currentState isEqualToString:@"GameOver"])
        {
            [[Simulator SharedSimulator] StopGame];
        }
        
        [[Simulator SharedSimulator] StartGame];
        [self setCurrentState:newState];
        [(GameStateManager *)_subject Done];
        return;
    }
    else if ([newState isEqualToString:@"Unpausing"])
    {
        [[InterfaceManager SharedInterfaceManager] Unpause];
        [self setCurrentState:newState];
        [(GameStateManager *)_subject Done];
        return;
    }
    
    // User quit the game.
    if([newState isEqualToString:@"MainMenu"] && [_currentState isEqualToString:@"Paused"])
    {
        [[Simulator SharedSimulator] StopGame];
    }
    
    // User quit after game over.
    if([newState isEqualToString:@"MainMenu"] && [_currentState isEqualToString:@"GameOver"])
    {
        [[Simulator SharedSimulator] StopGame];
    }
    
    if([newState isEqualToString:@"GameSession"] && [_currentState isEqualToString:@"Unpausing"])
    {
        [self setCurrentState:newState];
        return;
    }
    
    [self setCurrentState:newState];
    
    [[InterfaceManager SharedInterfaceManager] runScene:[_subject State]];
}

-(void)setCurrentState:(NSString *)newState
{
    if(_currentState)
    {
        [_currentState autorelease];
    }
    
    _currentState = [newState retain];
}

-(void)dealloc
{
    if(_currentState)
    {
        [_currentState release];
    }
    
    [super dealloc];
}

@end
