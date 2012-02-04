//
//  TorchFlameLayer.m
//  Pass The Flame
//
//  Created by Momchil Tomov on 2/2/12.
//  Copyright (c) 2012 Princeton University. All rights reserved.
//

#import "FlameLayer.h"
#import <QuartzCore/QuartzCore.h>

@implementation FlameLayer
{
    CAEmitterLayer* fireEmitter;
}

+ (Class)layerClass
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize size = [[UIScreen mainScreen] bounds].size;
        
        fireEmitter = (CAEmitterLayer *)self.layer;
        fireEmitter.zPosition = 1;
        fireEmitter.emitterMode = kCAGravityBottom;
        fireEmitter.emitterShape = kCAEmitterLayerRectangle;
        fireEmitter.emitterPosition = CGPointMake(size.width / 2, size.height / 2 - 30 );
        fireEmitter.emitterSize = CGSizeMake(40, 20);
        fireEmitter.renderMode = kCAEmitterLayerAdditive;
        
        CAEmitterCell *fire = [CAEmitterCell emitterCell];
        
        fire.emissionLongitude = M_PI * 3/2;
        fire.emissionLatitude = 0;//-M_PI / 2;
        fire.emissionRange = M_PI / 4;
        
        fire.birthRate = 130;
        fire.lifetime = 2.3;
        fire.lifetimeRange = 2.0;//1.85;
        
        //    fire.
        
        fire.velocity = 80;
        fire.velocityRange = 80;
        
        fire.yAcceleration = 10;
        
        fire.scale = 1.5;
        fire.scaleRange = 0.6;
        fire.scaleSpeed = -0.2;
        //fire.spin = 0.5;
        
        
        
        fire.color = [[UIColor colorWithRed:0.99
                                      green:0.4
                                       blue:0.1
                                      alpha:0.1] 
                      CGColor];
        fire.contents = (id)[[UIImage imageNamed:@"fire_particle_large.png"] CGImage];
        [fire setName:@"fire"];
        
        /*float gas=1;
         // Create the fire emitter cell
         CAEmitterCell *fire = [CAEmitterCell emitterCell];
         fire.emissionLongitude = M_PI;
         fire.emissionLatitude = -M_PI/2 ;
         fire.BirthRate = 100*gas;
         fire.lifetime=gas;
         fire.lifetimeRange=gas*0.35;
         fire.Velocity = 80;
         fire.VelocityRange = 21;
         fire.EmissionRange = 1.1f;
         fire.yAcceleration = -200;
         fire.ScaleSpeed = 0.3f;
         fire.color=[[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
         fire.contents = (id)[[UIImage imageNamed:@"fire_particle.png"] CGImage];
         [fire setName:@"fire"];
         
         CAEmitterCell *smoke = [CAEmitterCell emitterCell];
         smoke.BirthRate = 11;
         smoke.emissionLongitude = -M_PI ;
         smoke.emissionLatitude=-M_PI;
         smoke.lifetime = gas*4;
         smoke.Velocity = 40;
         smoke.VelocityRange = 20;
         smoke.emissionRange = M_PI / 4;
         smoke.Spin = 1;
         smoke.SpinRange = 6;
         smoke.yAcceleration = -160;
         smoke.Scale = 0.1f;
         smoke.AlphaSpeed = -0.22f;
         smoke.ScaleSpeed = 0.7f;
         smoke.color=[[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3*gas] CGColor];
         
         smoke.contents = (id)[[UIImage imageNamed:@"fire_particle.png"] CGImage];
         [smoke setName:@"smoke"];*/
        
        fireEmitter.emitterCells = [NSArray arrayWithObjects:fire, nil];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
