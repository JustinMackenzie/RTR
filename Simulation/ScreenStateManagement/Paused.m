//
//  Paused.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Paused.h"
#import "GameStateManager.h"
#import "GameStates.h"

@implementation Paused

-(NSString *)State
{
    return @"Paused";
}

-(void)Back:(GameStateManager *)context
{
    [context SetGameState:[[[Unpausing alloc]init]autorelease]];
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
    return;
}

-(void)Quit:(GameStateManager *)context
{
    [context SetGameState:[[[MainMenu alloc]init]autorelease]];
}

-(void)Restart:(GameStateManager *)context
{
    [context SetGameState:[[[GameStarting alloc]init]autorelease]];
}

-(void)Done:(GameStateManager *)context
{
    return;
}

@end
