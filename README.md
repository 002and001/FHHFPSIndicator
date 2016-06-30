# FHHFPSIndicator
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/FHHFPSIndicator.svg?style=flat)](http://cocoapods.org/?q=FHHFPSIndicator)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/FHHFPSIndicator.svg?style=flat)](http://cocoapods.org/?q=FHHFPSIndicator)&nbsp;


FHHFPSIndicator can show FPS in your APP

Demo Project
==============
See `Demo/FHHFPSIndicatorDemo`


<img src="https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/Demo/Snapshots/snapshot1.PNG" width="320"><br/>

<img src="https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/Demo/Snapshots/snapshot2.PNG" width="320"><br/>

<img src="https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/Demo/Snapshots/snapshot3.PNG" width="320"><br/>

<img src="https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/Demo/Snapshots/snapshot4.PNG" width="320"><br/><br/>


Installation
==============
### CocoaPods

1. Add `pod "FHHFPSIndicator"` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<FHHFPSIndicator/FHHFPSIndicator.h\>.

### Manually
1. Drag all source files under floder `FHHFPSIndicator` to your project
2. Import the main header file：`#import "FHHFPSIndicator.h"`

###Instruction
you shoud call 	 after the keyWindw becomes keyAndVisible;

Advice:Use FHHFPSIndicator in DEBUG mode

add the code in AppDelegate.m 

<pre>
#if defined(DEBUG) || defined(_DEBUG)
#import "FHHFPSIndicator.h"
#endif

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    // add the follwing code after the window become keyAndVisible
    #if defined(DEBUG) || defined(_DEBUG)
        [[FHHFPSIndicator sharedFPSIndicator] show];
//        [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopRight;
    #endif
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    
    return YES;
}

</pre>

License
==============
FHHFPSIndicator is provided under the MIT license. See LICENSE file for details.

<br/>
---
中文介绍
==============
FHHFPSIndicator可以用于在iOS开发中显示当前画面的FPS.

演示项目
==============
查看并运行 `Demo/FHHFPSIndicatorDemo`


<img src="https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/Demo/Snapshots/snapshot1.PNG" width="320"><br/>

<img src="https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/Demo/Snapshots/snapshot2.PNG" width="320"><br/>

<img src="https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/Demo/Snapshots/snapshot3.PNG" width="320"><br/>

<img src="https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/Demo/Snapshots/snapshot4.PNG" width="320"><br/><br/>

安装
==============

### CocoaPods

1. 在 Podfile 中添加  `pod "FHHFPSIndicator"`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 \<FHHFPSIndicator/FHHFPSIndicator.h\>。

### 手动安装
1. 将`FHHFPSIndicator`文件夹中的所有源代码拽入项目中。
2. 导入主头文件：`#import "FHHFPSIndicator.h"`。

###使用说明
在AppDelegate.m文件中的didFinishLaunchingWithOptions方法中，当执行了`[self.window makeKeyAndVisible];`后，调用`[[FHHFPSIndicator sharedFPSIndicator] show]`。<br/>
建议：在DEBUG模式下使用显示FPS功能

<pre>
#if defined(DEBUG) || defined(_DEBUG)
#import "FHHFPSIndicator.h"
#endif

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    // add the follwing code after the window become keyAndVisible
    #if defined(DEBUG) || defined(_DEBUG)
        [[FHHFPSIndicator sharedFPSIndicator] show];
//        [FHHFPSIndicator sharedFPSIndicator].fpsLabelPosition = FPSIndicatorPositionTopRight;
    #endif
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    
    return YES;
}

</pre>

许可证
==============
FHHFPSIndicator 使用 MIT 许可证，详情见 LICENSE 文件。
