//
//  DoubleJumping.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "DoubleJumping.h"
#import "CharacterStateManager.h"
#import "CharacterStates.h"

@implementation DoubleJumping

-(void)Jump:(CharacterStateManager *)context
{
    return;
}

-(void)Done:(CharacterStateManager *)context
{
    [context SetCharacterState:[[[Falling alloc]init]autorelease]];
}

-(NSString *)State
{
    return @"DoubleJumping";
}

@end
