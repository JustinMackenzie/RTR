//
//  MainMenu.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-14.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "MainMenu.h"
#import "GameStateManager.h"
#import "GameStates.h"

@implementation MainMenu

-(NSString *)State
{
    return @"MainMenu";
}

-(void)Back:(GameStateManager *)context
{
    return;
}

-(void)How:(GameStateManager *)context
{
    [context SetGameState:[[[How alloc]init]autorelease]];
}

-(void)About:(GameStateManager *)context
{
    [context SetGameState:[[[About alloc]init]autorelease]];
}

-(void)Settings:(GameStateManager *)context
{
    [context SetGameState:[[[Settings alloc]init]autorelease]];
}

-(void)Play:(GameStateManager *)context
{
    [context SetGameState:[[[GameStarting alloc]init]autorelease]];
}

-(void)Pause:(GameStateManager *)context
{
    return;
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
    return;
}

@end
