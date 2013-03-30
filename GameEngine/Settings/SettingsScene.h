//
//  SettingsScene.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "GameScene.h"

@class SettingsLayer;

@interface SettingsScene : GameScene
{
    SettingsLayer *_settingsLayer;
}

-(SettingsLayer *)GetSettingsLayer;

@end
