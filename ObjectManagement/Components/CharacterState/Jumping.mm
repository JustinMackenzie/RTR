//
//  Jumping.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Jumping.h"
#import "CharacterStateManager.h"
#import "CharacterStates.h"

@implementation Jumping

-(void)Jump:(CharacterStateManager *)context
{
    [context SetCharacterState:[[[DoubleJumping alloc]init]autorelease]];
}

-(void)Done:(CharacterStateManager *)context
{
    [context SetCharacterState:[[[Moving alloc]init]autorelease]];
}

-(NSString *)State
{
    return @"Jumping";
}

@end
