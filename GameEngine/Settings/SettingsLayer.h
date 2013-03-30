//
//  SettingsLayer.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-24.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import "TouchLayer.h"

@interface SettingsLayer : TouchLayer
{
    CCMenuItemImage *easyButton;
    CCMenuItemImage *mediumButton;
    CCMenuItemImage *hardButton;
}

-(void)SelectedButton:(NSString *)difficulty;

@end
