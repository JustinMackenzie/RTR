//
//  InputHandler.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-22.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InputHandler <NSObject>

-(void)PlayPressed:(id)sender;
-(void)BackPressed:(id)sender;
-(void)HowPressed:(id)sender;
-(void)SettingsPressed:(id)sender;
-(void)AboutPressed:(id)sender;
-(void)PausePressed:(id)sender;
-(void)RestartPressed:(id)sender;
-(void)QuitPressed:(id)sender;
-(void)JumpPressed:(id)sender;
-(void)EasyPressed:(id)sender;
-(void)MediumPressed:(id)sender;
-(void)HardPressed:(id)sender;

@end
