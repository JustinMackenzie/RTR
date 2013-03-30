//
//  Moving.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Moving.h"
#import "CharacterStateManager.h"
#import "CharacterStates.h"

@implementation Moving

-(void)Jump:(CharacterStateManager *)context
{
    [context SetCharacterState:[[[Jumping alloc]init]autorelease]];
}

-(void)Done:(CharacterStateManager *)context
{
    return;
}

-(NSString *)State
{
    return @"Moving";
}

@end
