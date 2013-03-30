//
//  PlayCommand.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "PlayCommand.h"
#import "GameStateManager.h"

@implementation PlayCommand

-(void)Execute
{
    [_reciever Play];
}

@end
