//
//  InputManager.m
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "InputManager.h"
#import "CommandManager.h"
#import "GameStateManager.h"
#import "Commands.h"
#import "ObjectSystem.h"
#import "GameObject.h"
#import "Simulator.h"
#import "InterfaceManager.h"
#import "SettingsLayer.h"

@implementation InputManager

-(id)initWithCommandManager:(CommandManager *)commandManager GameStateManager:(GameStateManager *)gameStateManager
{
    self = [super init];
    
    if(self)
    {
        _commandManager = [commandManager retain];
        _gameStateManager = [gameStateManager retain];
    }
    
    return self;
}

-(void)PlayPressed:(id)sender
{
    [_commandManager PlaceCommand:[[[PlayCommand alloc]initWithReciever:_gameStateManager]autorelease]];
}

-(void)BackPressed:(id)sender
{
    [_commandManager PlaceCommand:[[[BackCommand alloc]initWithReciever:_gameStateManager]autorelease]];
}

-(void)HowPressed:(id)sender
{
    [_commandManager PlaceCommand:[[[HowCommand alloc]initWithReciever:_gameStateManager]autorelease]];
}

-(void)SettingsPressed:(id)sender
{
    [_commandManager PlaceCommand:[[[SettingsCommand alloc]initWithReciever:_gameStateManager]autorelease]];
}

-(void)AboutPressed:(id)sender
{
    [_commandManager PlaceCommand:[[[AboutCommand alloc]initWithReciever:_gameStateManager]autorelease]];
}

-(void)PausePressed:(id)sender
{
    [_commandManager PlaceCommand:[[[PauseCommand alloc]initWithReciever:_gameStateManager]autorelease]];
}

-(void)RestartPressed:(id)sender
{
    [_commandManager PlaceCommand:[[[RestartCommand alloc]initWithReciever:_gameStateManager]autorelease]];
}

-(void)QuitPressed:(id)sender
{
    [_commandManager PlaceCommand:[[[QuitCommand alloc]initWithReciever:_gameStateManager]autorelease]];
}

-(void)JumpPressed:(id)sender
{
    [_commandManager PlaceCommand:[[[JumpCommand alloc]initWithReciever:(CharacterStateManager *)[[[ObjectSystem SharedObjectSystem]GetTubby] GetComponent:@"CharacterStateManager"]]autorelease]];
}

-(void)EasyPressed:(id)sender
{
    [[Simulator SharedSimulator]SetDifficulty:@"Easy"];
    //[[[InterfaceManager SharedInterfaceManager]GetSettingsLayer] SelectedButton:@"Easy"];
}

-(void)MediumPressed:(id)sender
{
    [[Simulator SharedSimulator]SetDifficulty:@"Medium"];
    //[[[InterfaceManager SharedInterfaceManager]GetSettingsLayer] SelectedButton:@"Medium"];
}

-(void)HardPressed:(id)sender
{
    [[Simulator SharedSimulator]SetDifficulty:@"Hard"];
    //[[[InterfaceManager SharedInterfaceManager]GetSettingsLayer] SelectedButton:@"Hard"];
}

-(void)dealloc
{
    [_commandManager release];
    [_gameStateManager release];
    [super dealloc];
}


@end
