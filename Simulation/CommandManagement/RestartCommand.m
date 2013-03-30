//
//  RestartCommand.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "RestartCommand.h"
#import "GameStateManager.h"

@implementation RestartCommand

-(void)Execute
{
    [_reciever Restart];
}

@end
