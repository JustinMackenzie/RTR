//
//  Falling.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "Falling.h"
#import "CharacterStateManager.h"
#import "CharacterStates.h"

@implementation Falling

-(void)Jump:(CharacterStateManager *)context
{
    return;
}

-(void)Done:(CharacterStateManager *)context
{
    [context SetCharacterState:[[[Moving alloc]init]autorelease]];
}

-(NSString *)State
{
    return @"Falling";
}

@end
