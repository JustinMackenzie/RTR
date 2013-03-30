//
//  JumpCommand.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-27.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

@class CharacterStateManager;

@interface JumpCommand : NSObject <Command>
{
    CharacterStateManager *_reciever;
}

-(id)initWithReciever:(CharacterStateManager *)reciever;

@end
