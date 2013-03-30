//
//  SettingsCommand.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "SettingsCommand.h"
#import "GameStateManager.h"

@implementation SettingsCommand

-(void)Execute
{
    [_reciever Settings];
}

@end
