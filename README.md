##核心动画

###隐式动画:View.alpha layer.opacity

###CALayer中的三棵树

- Render Tree(Private):Layer的渲染（私有的，无法访问）
- Model Layer Tree:可以通过[layer modelLayer]来访问，返回值是一个CALayer（最终的值）
- Presentation Layer Tree:可以通过[layer presentationLayer]来访问，返回一个CALayer(在一个动画过程中，layer在某一个时间点的静态值)

###CATransaction 事务,作用:打包当前时间点的所有的动画操作，最后提交给Render Tree进行渲染

```
+ (void)begin
+ (void)commit

```

####配置隐式动画
```
- (void)testTransaction
{
    //需要把代码写在begin与commit之间
    [CATransaction begin];
    //控制动画的时间，默认是1/4秒
    [CATransaction setAnimationDuration:5];
    
    [CATransaction setCompletionBlock:^{
        NSLog(@"动画结束了~~~~");
    }];
    _myLayer.position = CGPointMake(_myLayer.position.x + 100, _myLayer.position.y);
    
    [CATransaction commit];
}

```
####禁用隐式动画

```
- (void)testDisableTransaction
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _myLayer.position = CGPointMake(_myLayer.position.x + 100, _myLayer.position.y);
    [CATransaction commit];
}

```

####事务也有显式和隐式:就是begin 和commit;没有设置就是隐式的；隐式是不设置时间的默认为0.25秒
` layer.position = CGPointMake(layer.position.x + 100, layer.position.y);`

###显式动画
####CABaseicAnimation
####动画的基本要素；图:

```
//哪个动
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
 [CABasicAnimation animationWithKeyPath:@"position"];
 //结构体，属性
 [CABasicAnimation animationWithKeyPath:@"positin.x"];
    
```

```
//怎么动?
//指定的属性从哪个值到哪个值fromValue,toValue
@property(nullable, strong) id fromValue;
@property(nullable, strong) id toValue;
@property(nullable, strong) id byValue;
```
###byValue的表

```
/**
* 第一个参数:CAAnimation类对象
* 第二个参数:key,动画的标识符
*/
- (void)addAnimation:(CAAnimation *)anim forKey:(nullable NSString *)key;

//获取当前CALayer上所有的keys
- (nullable NSArray<NSString *> *)animationKeys;
//通过某一个key来获取CALayer上的CAAnimation对象
- (nullable CAAnimation *)animationForKey:(NSString *)key;
- 
```

###CAMediaTiming协议
```
//默认为0，如果这里不写的话会使用事务中的0.25秒
@property CFTimeInterval duration;
//默认是0，不重复，大于0就是重复的次数。无限重复:HUGE_VALF
@property float repeatCount;
//动画的重复持续多少秒,4/2就是2个循环，不能与repeatCount同时使用
@property CFTimeInterval repeatDuration;
@property BOOL autoreverses;
```

###动画结束后如何不返回原状态?
```
CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
basicAnimation.toValue = @(_myLayer.position.x + 100);   basicAnimation.duration = 2;
[_myLayer addAnimation:basicAnimation forKey:@"positionAnimation"];
    
```

###CAAnimation

```
CAMediaTimingFunction:比UIViewAnimationCurve更强大
/* A convenience method for creating common timing functions. The
 * currently supported names are `linear', `easeIn', `easeOut' and
 * `easeInEaseOut' and `default' (the curve used by implicit animations
 * created by Core Animation). */

+ (instancetype)functionWithName:(NSString *)name;
//初始化方法，使用比较多

//[(0,0), c1, c2, (1,1)]这样就可以生成一条贝塞尔曲线
+ (instancetype)functionWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y;

```

```
//动画开始之前调用
- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始之前");
}

//动画结束后调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画结束之后");
}

```

###移除动画
```
- (void)removeAllAnimations;

- (void)removeAnimationForKey:(NSString *)key;

```

###fileModel



