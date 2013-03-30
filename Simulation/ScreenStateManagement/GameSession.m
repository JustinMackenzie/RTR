//
//  GameSession.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "GameSession.h"
#import "GameStateManager.h"
#import "GameStates.h"

@implementation GameSession

-(NSString *)State
{
    return @"GameSession";
}

-(void)Back:(GameStateManager *)context
{
    return;
}

-(void)How:(GameStateManager *)context
{
    return;
}

-(void)About:(GameStateManager *)context
{
    return;
}

-(void)Settings:(GameStateManager *)context
{
    return;
}

-(void)Play:(GameStateManager *)context
{
    return;
}

-(void)Pause:(GameStateManager *)context
{
    [context SetGameState:[[[Paused alloc]init]autorelease]];
}

-(void)Quit:(GameStateManager *)context
{
    return;
}

-(void)Restart:(GameStateManager *)context
{
    return;
}

-(void)Done:(GameStateManager *)context
{
    [context SetGameState:[[[GameOver alloc]init]autorelease]];
}

@end
