//
//  InputManager.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"

@class CommandManager;
@class GameStateManager;
@class CharacterStateManager;

@interface InputManager : NSObject <InputHandler>
{
    CommandManager *_commandManager;
    GameStateManager *_gameStateManager;
}

-(id)initWithCommandManager:(CommandManager *)commandManager GameStateManager:(GameStateManager *)gameStateManager;

@end
