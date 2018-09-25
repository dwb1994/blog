---
title: 提高网页设计里文本的易读性
date: 2018-09-24
tags: [design]
photos: [http://ww1.sinaimg.cn/large/006oPFLAly1fvkzqj4gqnj31hc0zkn3e.jpg]
---

```
技巧：
0. 根据使用场景的设备质量与稳定性确定是否需要更强烈的对比度
1. 正确使用对比度
2. 使用不同半透明度的文本，用于区分辅助文本、helper文本和icon。同时这样做可以让信息层次鲜明，有助于用户理解信息
2. 告别花花绿绿的颜色
多色背景，文字要加黑色背景
3. md里面找一找
实践出真知，屏幕质量、光源质量、其他光源影响、设备老化、色盲、色弱、甚至散光

对比度什么问题

material 的解决方案
与黑色的对比度，用的是 black .87 这是由于md中黑色文本最深色为.87

用js实现

最小对比度的规律

！支持半透明度
！支持基准参数调整

## 工具介绍
[tinycolor](https://github.com/bgrins/TinyColor)
[色彩对比度计算器](https://contrast-ratio.com/)
谷歌浏览器，控制台

## 算法探究与优化
```

# 提高网页设计里文本的易读性

网页设计中，文本是最常用的元素之一，文本易读性非常重要，我们都希望页面更加清晰易读，而颜色在文本易读性中起到了至关重要的作用。

文本和背景颜色有一个“对比度”，了解并能正确调整这个对比度，将会让你的页面更加清晰易读，进而提高阅读效率和阅读体验。

### 问题的由来：拯救你惨不忍睹的页面设计

在缺乏专业设计的页面中，我们经常见到下面这样的画面：

这是公司的某内部系统：
![](http://ww1.sinaimg.cn/large/006oPFLAly1fvknphxqyhj310q03176f.jpg)

公司某内部工具：
![](http://ww1.sinaimg.cn/large/006oPFLAly1fvl0oz431pj30gc02at8t.jpg)

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

![](http://ww1.sinaimg.cn/large/006oPFLAly1fvm422c251j318c0md442.jpg)

### 2. Chrome 浏览器控制台

对于开发的同学来说，这种方式也很快捷方便。新版的 Chrome 浏览器增强了 CSS 的调色功能：

打开控制台，选中一个 **文本元素** 然后在 Styles 中找到 color 属性，点击 **颜色值**，可以看到一个调色板。
![](http://ww1.sinaimg.cn/large/006oPFLAly1fvm4bflw8zj30hd09wq4z.jpg)

然后点击调色板的 Contrast radio 选项，展开对比度计算工具，可以看到上方的调色板出现一条白线，这条白线就是符合 AA 级对比度标准的临界值。调色板中的圆圈就是当前选中的色值，拖动这个色值即可调整文本颜色，这时下方的对比度计算工具进行了实时计算：

<div class="imgContainer">
  <img src="https://ww1.sinaimg.cn/large/006oPFLAly1fvm4mbk5tpj306f0b1wfe.jpg" /><img src="https://ww1.sinaimg.cn/large/006oPFLAly1fvm4vfw2h7g306f0b1x3p.jpg" />
</div>

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

![](http://ww1.sinaimg.cn/large/006oPFLAly1fvm5vcxwwfj30f002aq3a.jpg)

可以看到状态栏的文本是黑色，而 header 中的文本颜色又是白色，一般来说状态栏的颜色设置为黑色或白色（iOS 中只能设置这两种颜色），这时状态栏的颜色最好根据 js 来计算，而不是人为设置黑色或白色。

## 一些技巧

<style>
.imgContainer {
  display: flex;
}
</style>