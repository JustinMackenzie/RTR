//
//  PhysicalMan.h
//  RTR_newPhysics
//
//  Created by Scott van Heesch on 13-01-28.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#define PTM_RATIO 32

@interface PhysicalMan : NSObject {
    b2World *_world;
    CGPoint _position;
    
    b2Body *mainBody;
    
    
    b2Body *worldAnchor;
    //b2Body *sensorAnchor;
    
    
    b2RevoluteJoint *head;
    
    b2Body *groundSensor;
    b2Body *jumpSensor;
    b2Body *boxSensor;
    
    b2RevoluteJoint *leftLeg;
    b2RevoluteJoint *rightLeg;
    b2RevoluteJoint *leftArm;
    b2RevoluteJoint *rightArm;
    
    b2RevoluteJoint *lowerLeftLeg;
    b2RevoluteJoint *lowerRightLeg;
    b2RevoluteJoint *lowerLeftArm;
    b2RevoluteJoint *lowerRightArm;
    
    bool manCanJump;
    bool manStandingUp;
    bool manCanDoubleJump;
    
    float tick;
    float velocity;
    
@public
    b2Vec2 bodyPos;
    
}

@property (nonatomic, assign) CGPoint Position;

-(void) updateMovement:(float)ticker;

-(bool)canJump;


-(id)initWithWorld:(b2World *)world Position:(CGPoint)position;

-(void)createCharacterInWorld:(b2World*)theWorld LL:(CCSprite*)LL RL:(CCSprite*)RL LLL:(CCSprite*)LLL LRL:(CCSprite*)LRL B:(CCSprite*)B H:(CCSprite*)H LA:(CCSprite*)LA RA:(CCSprite*)RA LLA:(CCSprite*)LLA LRA:(CCSprite*)LRA;



-(void) moveSetVertVelocity:(float)jumpVelocity;


-(bool) getCanJump;

-(bool) getCanDoublejump;

-(void) setCanDoubleJump:(bool)canDJ;


@end
