//
//  AboutCommand.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-20.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "AboutCommand.h"
#import "GameStateManager.h"

@implementation AboutCommand

-(void)Execute
{
    [_reciever About];
}

@end
