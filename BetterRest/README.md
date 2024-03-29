#  <#Title#>

今天，你有五个专题工作过，你会满足Stepper，DatePicker，DateFormatter，等等。


## BetterRest：简介
这个SwiftUI项目是另一个基于表单的应用程序，它将要求用户输入信息并将所有信息转换为警报，这听起来可能很乏味–您已经做到了，对吗？

好吧，是的，但是练习绝不是一件坏事。但是，我们有一个相当简单的项目是因为我想向您介绍iOS开发的真正强大功能之一：机器学习（ML）。

所有iPhone均内置有一项称为Core ML的技术，该技术使我们能够编写代码，从而根据所看到的先前数据对新数据进行预测。我们将从一些原始数据开始，将其作为训练数据提供给我们的Mac，然后使用结果构建一个能够对新数据进行准确估算的应用程序-全部在设备上，并为用户提供完全的隐私权。

我们正在构建的实际应用程序称为BetterRest，它旨在通过向咖啡饮用者提出以下三个问题来帮助他们改善睡眠质量：

他们什么时候想醒来？
他们想要多少个小时的睡眠？
他们每天喝几杯咖啡？
一旦有了这三个值，我们会将它们输入Core ML，以得到一个告诉我们何时该睡觉的结果。如果您考虑一下，就会有数十亿个可能的答案–所有各种唤醒时间乘以所有睡眠小时数，再乘以全部咖啡量。

这就是机器学习的用武之地：使用一种称为回归分析的技术，我们可以要求计算机提出一种能够代表我们所有数据的算法。反过来，这又使它可以将算法应用于以前从未见过的新数据，并获得准确的结果。

用步进器输入数字
使用DatePicker选择日期和时间
处理日期
使用Create ML训练模型
Core ML能够处理各种训练任务，例如识别图像，声音甚至运动，但是在这种情况下，我们将研究表格回归。这是一个花哨的名字，在机器学习中很常见，但是它的真正含义是我们可以在Create ML上放置大量类似于电子表格的数据，并要求它找出各种值之间的关系。

机器学习分两个步骤完成：我们训练模型，然后让模型进行预测。
训练是计算机查看我们所有数据以找出我们拥有的所有值之间的关系的过程，而在大型数据集中，这可能需要很长时间-轻松几个小时，甚至可能更长。
预测是在设备上完成的：我们将训练后的模型提供给它，它将使用以前的结果对新数据进行估算。

现在开始培训过程：请在Mac上打开“创建ML”应用。如果您不知道它在哪里，可以通过Xcode菜单并选择Open Developer Tool> Create ML从Xcode启动它。

