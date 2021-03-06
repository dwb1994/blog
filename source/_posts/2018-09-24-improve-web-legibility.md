---
title: 提高网页设计里文本的易读性
date: 2018-09-24
tags: [design]
photos: [https://ww1.sinaimg.cn/large/006oPFLAly1fvkzqj4gqnj31hc0zkn3e.jpg]
---
# 提高网页设计里文本的易读性

网页设计中，文本是最常用的元素之一，文本易读性非常重要，我们都希望页面更加清晰易读，而颜色在文本易读性中起到了至关重要的作用。

文本和背景颜色有一个“对比度”，了解并能正确调整这个对比度，将会让你的页面更加清晰易读，进而提高阅读效率和阅读体验。

### 问题的由来：拯救你惨不忍睹的页面设计

在缺乏专业设计的页面中，我们经常见到下面这样的画面：

这是公司的某内部系统：
<img src="https://ww1.sinaimg.cn/large/006oPFLAly1fvo3kq4rgzj310q031ac9.jpg" style="width:100%; max-width: 661px;" />

公司某内部工具：
<img src="https://ww1.sinaimg.cn/large/006oPFLAly1fvl0oz431pj30gc02at8t.jpg" style="width:100%; max-width: 294px;" />

有没有觉得上面的文本特别刺眼，难以识别？

## 标准

上面的两个案例，本质上都是文本色与背景色的“对比度”不足导致的，足够的色彩“对比度”可让文字和图片更易于阅读和理解。

“对比度”是指显示屏上两种相邻颜色之间的亮度或发出光线的强度的差异计算值。这个比值的范围在 1 到 21 之间（通常写为 1:1 到 21:1）；该值越大，则对比度越高。

实际上，W3C 的 Web 无障碍推进组织制定了 [Web 内容无障碍指南(WCAG)](https://www.w3.org/Translations/WCAG20-zh/)，这个指南涉及了一些建议，这些建议可使 Web 内容更容易访问。遵循这些原则，能够让内容更易为广大残障人士所接受，包括失明和低视力、失聪和重听、学习障碍、认知障碍、行动不便、言语残疾、光过敏患者和这些病症的复合患者。遵循这些原则也可让普通用户更容易访问 Web 内容。

**简单总结一下这个标准：**

|  对比度等级   | 普通文本 | 大型文本  |
| :------- | :--------| :-- |
| AA  | 4.5:1 |  3:1  |
| AAA   |  7:1 |  4.5:1  |

对比度等级:
- AA 级: 符合要求的最小对比度
- AAA 级: 增强版的对比度，文字更清晰

字体大小的分界线：
- 普通文本: 小于 18 磅的常规字体或 14 磅的加粗字体
- 大型文本: 于 18 磅的常规字体或 14 磅的加粗字体

那么如何实现符合 WCAG 规范的对比度呢？如何在项目中渐变快捷地进行调整呢？

## 使用工具调整对比度

有很多工具可以调整对比度，这里列举一些我使用过的工具：

### 1. [色彩对比度计算器](https://contrast-ratio.com/)

一个在线的，计算任意两种有效 CSS 颜色之间对比度的工具。

两侧分别为文本颜色与背景色，中间一个醒目的圆盘，显示二者的对比度，鼠标移动到这个圆盘上可以查看该对比度符合 AA/AAA 对比度标准。

![](https://ww1.sinaimg.cn/large/006oPFLAly1fvm422c251j318c0md442.jpg)

### 2. Chrome 浏览器控制台

对于开发的同学来说，这种方式也很快捷方便。新版的 Chrome 浏览器增强了 CSS 的调色功能：

打开控制台，选中一个 **文本元素** 然后在 Styles 中找到 color 属性，点击 **颜色值**，可以看到一个调色板。
![](https://ww1.sinaimg.cn/large/006oPFLAly1fvoa81omdyj30hd09w40q.jpg)

然后点击调色板的 Contrast radio 选项，展开对比度计算工具，可以看到上方的调色板出现一条白线，这条白线就是符合 AA 级对比度标准的临界值。调色板中的圆圈就是当前选中的色值，拖动这个色值即可调整文本颜色，这时下方的对比度计算工具进行了实时计算：

<div class="imgContainer"><img src="https://ww1.sinaimg.cn/large/006oPFLAly1fvm4mbk5tpj306f0b1wfe.jpg" /><img src="https://ww1.sinaimg.cn/large/006oPFLAly1fvm4vfw2h7g306f0b1x3p.jpg" /></div>

### 3. 使用 JS 进行精准计算

通过构建工具即可在构建时进行对比度的验证，从而保证 UI 中的文本易读性符合标准。

有一些开源的 JS 库可以进行对比度的计算，这里我找到了一个很好用的库： [TinyColor](https://github.com/bgrins/TinyColor#readability), 通过 readability 函数计算两个颜色的对比度：

``` js
tinycolor.readability("#000", "#000"); // 1
tinycolor.readability("#000", "#111"); // 1.1121078324840545
tinycolor.readability("#000", "#fff"); // 21
```

通过 isReadable 函数判断是否符合 AA/AAA 级对比度标准：

``` js
tinycolor.isReadable("#000", "#111", {}); // false
tinycolor.isReadable("#ff0088", "#5c1a72",{level:"AA",size:"small"}); //false
tinycolor.isReadable("#ff0088", "#5c1a72",{level:"AA",size:"large"}), //true
```

通过 JS 进行对比度的计算，举个栗子，一个最常见的场景: 手机顶部状态栏中文本非常显眼，背景色多变，但文本色的正确搭配往往被忽视，下图是我们 APP 中某个页面的状态栏：

<img src="https://ww1.sinaimg.cn/large/006oPFLAly1fvm5vcxwwfj30f002aq3a.jpg" style="width:100%; max-width: 540px;" />

可以看到状态栏的文本是黑色，而 header 中的文本颜色又是白色，一般来说状态栏的颜色设置为黑色或白色（iOS 中只能设置这两种颜色），这时状态栏的颜色最好根据 js 来计算，人为设置黑色或白色容易搭配不当或者遗漏配置。

## 一些技巧

### 1. 文本使用带有半透明度的黑色或白色

在彩色背景上使用灰色文本会降低对比度:

<img src="https://ww1.sinaimg.cn/large/006oPFLAly1fvma9idexgj30iw07st9g.jpg" style="width:100%; max-width: 680px;" />

最早是在 Material Design 的设计规范中看到的这个技巧，使用透明的黑白色文本和彩色背景的时候，文本颜色会混合成相应的深色，例如上图中的深粉色。这样做的好处是背景颜色变化的时候文本颜色会自动混合成对应的深色，不必改变文本的颜色值。

### 2. 告别五彩斑斓的文本

页面中色彩不宜过多，谨慎使用彩色文本，应该把彩色留给按钮、链接、开关等组件，这样做的好处是文本层次鲜明，**失去控制**的过多色彩会让内容缺乏重点。

正文使用黑白色（在大段的正文中使用彩色文本不利于阅读）

### 3. 使用不同半透明度的文本

按照功能的重要性，为文本制定不同半透明度的规范，从而对不同层次信息的对比度加以区分。

使用不同半透明度的文本，用于区分标题、正文、描述文本、提示文本和icon。这样做可以让读者阅读起来有一定的优先级关系，可以让信息层次鲜明，有助于用户理解关键信息，减少阅读时候的疲劳感。

<img src="https://ww1.sinaimg.cn/large/006oPFLAly1fvmaudlnt7j315o0ekjun.jpg" style="width:100%; max-width: 700px;" />

### 4. 多种色彩的背景上使用文本

如果背景的色彩比较复杂（如渐变色、图案等），则可以根据平均值来作为背景色计算对比度。

如果背景色的色彩差异较大，则应在文本和背景之间添加遮罩。

### 5. 使用 JS 进行对比度的计算

即上文提到的使用 [TinyColor](https://github.com/bgrins/TinyColor#readability) 工具进行精确计算，在构建工具中验证。

### 6. 根据实际场景调整对比度

虽然 WCAG 提出了 AA/AAA 级对比度标准，但是实际使用时应从用户角度出发，根据实际场景确定是否需要更强烈的对比度，举几个例子：

- 设备质量：屏幕质量是否比较差、投影仪是否老化，显示效果不好的时候应提高对比度
- 分散注意：用户在跑步、乘车、嘈杂环境这样的不稳定场景中使用，分散在界面上的注意力会大打折扣，这时应提高对比度
- 用户视觉能力：近视、散光甚至色盲、色弱的比例
- 其他影响：是否有其他光源影响显示

## 算法探究与优化

### Material Design 根据对比度判断使用黑色/白色的源码

[源码链接](https://github.com/material-components/material-components-web/blob/master/packages/mdc-theme/_functions.scss)

这段代码用 sass 实现了若干函数，其中：

** 1. @function mdc-theme-contrast-tone ** 传入一个颜色值，返回该颜色背景上应该使用的颜色为 **light / dark** 颜色

** 2. @function mdc-theme-tone ** 传入一个颜色值，返回该颜色为 **light / dark** 颜色，核心代码：

``` scss
  // 传入的颜色值为 $color
  $lightContrast: mdc-theme-contrast($color, white); // 计算传入颜色和白色的对比度
  $darkContrast: mdc-theme-contrast($color, rgba(black, .87)); // 计算传入颜色和黑色的对比度
  $minimumContrast: 3.1; // 设置最小对比度
  @if ($lightContrast < $minimumContrast) and ($darkContrast > $lightContrast) {
    // 传入的颜色值和白色的对比度小于最小对比度 并且 和黑色的对比度更高
    @return "light"; // 我们认为传入的颜色是浅色
  } @else {
    // 我们认为传入的颜色是深色
    @return "dark";
  }
```

3.👆 上面的代码中用到了计算对比度的函数 **mdc-theme-contrast** 也在这段代码中，对比度是这样计算的：
``` scss
// 计算颜色的相对亮度（relative luminance）
@function mdc-theme-luminance($color) {
  $red: nth($mdc-theme-linear-channel-values, red($color) + 1);
  $green: nth($mdc-theme-linear-channel-values, green($color) + 1);
  $blue: nth($mdc-theme-linear-channel-values, blue($color) + 1);
  @return .2126 * $red + .7152 * $green + .0722 * $blue;
}
// 计算两个颜色的对比度（contrast ratio）
@function mdc-theme-contrast($back, $front) {
  $backLum: mdc-theme-luminance($back) + .05;
  $foreLum: mdc-theme-luminance($front) + .05;
  @return max($backLum, $foreLum) / min($backLum, $foreLum);
}
```

这里用到了一个对比度计算公式： [https://www.w3.org/TR/WCAG20-TECHS/G17.html#G17-tests](https://www.w3.org/TR/WCAG20-TECHS/G17.html#G17-tests)

可以看到一些有趣的参数：

``` scss
@return .2126 * $red + .7152 * $green + .0722 * $blue;
```

**相同的色值，绿色要显得亮一些，相反蓝色要显得暗一些。**

### 优化：支持半透明度颜色混合

Material Design 在计算传入颜色和黑色的对比度时，传入的是一个带有半透明度的色值，实际上在执行时会按照纯黑色(不带有半透明度)进行解析。

``` scss
$darkContrast: mdc-theme-contrast($color, rgba(black, .87)); // 计算传入颜色和黑色的对比度
```

我理解的 **rgba(black, .87)** 指的是 Material Design 规定的正文字体颜色（深色），因此这里按照半透明色进行解析会更好一些，这样我们判断颜色是深色还是浅色时的依据就是页面上最深的文本颜色 (#000 87%) 和最浅的背景颜色 (#fff 100%) 了。

用 js 来实现这个混合的过程 (依赖 tinycolor)：

``` js
// Alpha 合成 支持前景色半透明
function mixColor(front, back) {
  var rgbFront = tinycolor(front).toRgb();
  var rgbBack = tinycolor(back).toRgb();
  var alphaFront = rgbFront.a;
  var mixR = alphaFront * rgbFront.r + (1 - alphaFront) * rgbBack.r;
  var mixG = alphaFront * rgbFront.g + (1 - alphaFront) * rgbBack.g;
  var mixB = alphaFront * rgbFront.b + (1 - alphaFront) * rgbBack.b;
  var res = tinycolor({ r: mixR, g: mixG, b: mixB }).toHexString();
  return res;
}
```
Alpha 合成算法来自： [维基百科 - Alpha 合成](https://zh.wikipedia.org/wiki/Alpha%E5%90%88%E6%88%90)

### 优化：支持调节最小对比度

Material Design 中最小对比度是写死的 **3.1**，不知道为什么没有设置为 AA/AAA 级对比度标准，这里可以传入参数来指定最小对比度：

``` js
function contrast(color, contrast) {
  if (color === 'light' || color === 'dark') return color;
  var minimumContrast = contrast || 3.5;

  var lightContrast = getContrast(color, '#fff');
  var darkContrast = getContrast(color, '#000');

  if (lightContrast < minimumContrast && darkContrast > lightContrast) {
    return 'light';
  } else {
    return 'dark';
  }
}
```


### 用 js 实现


上文提到的 Material Design 的源码包含的几个函数，在 [TinyColor](https://github.com/bgrins/TinyColor) 这个工具里都有实现。

我按照 Material Design 的实现思路，用 js 实现了一遍，增加了上文提到的两个优化点 (支持半透明度颜色混合 / 支持调节最小对比度): [源码地址](https://github.com/dwb1994/lightordark)

## 参考资料

- [Android accessibility 帮助 - 色彩对比度](https://support.google.com/accessibility/android/answer/7158390?hl=zh-Hans)
- [Human Interface Guidelines - iOS - Accessibility](https://developer.apple.com/design/human-interface-guidelines/ios/app-architecture/accessibility/)
- [Material Design - Text legibility](https://material.io/design/color/text-legibility.html#)


<style>
.imgContainer {
  display: flex;
}

@media (max-width: 767px) {
  .imgContainer {
    display: block;
  }
}

</style>