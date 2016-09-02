//
//  SmallView.m
//  UIViewTest
//
//  Created by 梁兴胜 on 16/9/2.
//  Copyright © 2016年 Loyt. All rights reserved.
//

#import "SmallView.h"
#import "Masonry.h"

@interface SmallView ()
@property (nonatomic, strong) UIImageView *imageView;
@end
@implementation SmallView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    self.backgroundColor = [UIColor redColor];
    _imageView = [[UIImageView alloc] init];
    _imageView.image = [UIImage imageNamed:@"一无所有"];
    [self addSubview:_imageView];
    
    //1.
    //这种写法容易出问题,如果 SmallView 创建时没有设置 frame 或者重新约束,那么_imageView并不能达到预期的效果
//    SmallView init 会先执行这里,然后在约束SmallView,但是 imageview 的大小已经在这里定型了
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //问题就在self.bounds.size.width,self.bounds.size.height,如果外面创建SmallView时,没有 frame, 这里就是0了
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width, self.bounds.size.height));
        make.center.mas_equalTo(self);
    }];
    
    //2.
    //这种写法无论 SmallView在创建时有没有给定 frame 或者给了 frame 但是约束跟 frame 不一致也不会出问题.
//    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        //这里是约束,并不是 frame
//        //make.size.mas_equalTo(self);
//        make.width.mas_equalTo(self.mas_width);
//        make.height.mas_equalTo(self.mas_height);
//        make.center.mas_equalTo(self);
//    }];
}

@end
