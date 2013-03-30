//
//  CommandManager.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-20.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"
#import "Updatable.h"

@class Queue;

@interface CommandManager : NSObject <Updatable>
{
    Queue *_commandQueue;
}

-(void)PlaceCommand:(id<Command>)command;

@end
