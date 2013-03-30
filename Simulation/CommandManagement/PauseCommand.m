//
//  PauseCommand.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "PauseCommand.h"
#import "GameStateManager.h"

@implementation PauseCommand

-(void)Execute
{
    [_reciever Pause];
}

@end
