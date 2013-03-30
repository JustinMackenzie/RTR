//
//  Tubby.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-02-24.
//
//

#import "GameObject.h"
#import "Box2D.h"

@class Vector2f;

@interface Tubby : GameObject

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position World:(b2World *)world;
-(void)Jump;
-(void)DoubleJump;

@end
