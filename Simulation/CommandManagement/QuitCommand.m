//
//  QuitCommand.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "QuitCommand.h"
#import "GameStateManager.h"

@implementation QuitCommand

-(void)Execute
{
    [_reciever Quit];
}

@end
