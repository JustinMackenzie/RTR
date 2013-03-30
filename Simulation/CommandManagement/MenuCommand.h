//
//  MenuCommand.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GameStateManager;

@interface MenuCommand : NSObject
{
    GameStateManager *_reciever;
}

-(id)initWithReciever:(GameStateManager *)reciever;

@end
