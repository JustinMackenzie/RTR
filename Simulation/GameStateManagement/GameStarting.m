//
//  GameStarting.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-18.
//
//

#import "GameStarting.h"
#import "GameStates.h"
#import "GameStateManager.h"

@implementation GameStarting

-(NSString *)State
{
    return @"GameStarting";
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
    [context SetGameState:[[[GameSession alloc]init] autorelease]];
}

@end
