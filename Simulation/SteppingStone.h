//
//  SteppingStone.h
//  RTR_newPhysics
//
//  Created by Scott van Heesch on 13-02-24.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "PhysicalMan.h"

@interface SteppingStone : NSObject {
     b2World *_world;
     b2Body *platforms;
     b2Vec2 pos;
    // int r;
    int PSize;
    //CGPoint PLocation;
    CGSize _size;
}



-(id)initWithWorld:(b2World *)world;

-(void)createPlatformsInWorld:(b2World*)theWorld S1:(CCSprite*)S1 size:(int)size location:(CGPoint)location Speed:(float)speed;

-(void)updateMovement:(float)ticker;

-(CGPoint)getPosition;

-(bool)isOffScreen;

@end
