//
//  GameOver.m
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "GameOver.h"
#import "GameStates.h"
#import "GameStateManager.h"

@implementation GameOver

-(NSString *)State
{
    return @"GameOver";
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
    [context SetGameState:[[[MainMenu alloc]init]autorelease]];
}

-(void)Restart:(GameStateManager *)context
{
    [context SetGameState:[[[GameStarting alloc]init] autorelease]];
}

-(void)Done:(GameStateManager *)context
{
    return;
}


@end
