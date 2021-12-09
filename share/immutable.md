# 函数式编程 - 不可变（Immutable）



提到**Immutable**，第一时间想到的可能是常量、字符串或者这什么鬼。在**Functional Programming**是鼓励*Immutability*的，其实现在主流语言的发展方向也都是如此。

我认为从整体上看，语言的不可变性可以这么划分

- 可读性、编码约束
- 运行效率
- 逻辑推理和复杂性

> 当然还有数学/集合/范畴理论作为支撑，我等搬砖选手不用太在意（在意也没用……

上面那一段有点`语言学术`，通俗点讲

> **不变性背后的基本思想很简单：如果我们想改变一个数据结构，我们需要用改变创建一个新的副本，而不是改变原始数据结构**





## `拥抱变化`的坑里摸爬滚打

大部分人用OOP的思维编写CRUD代码时（例Java），惯例做法如下

```java
List<A> list = new ArrayList<>;
for (int i = 0; i < anotherList.size(); i++) {
    if (predicate == true) {
        list.add(anotherList[i]);
    }
}

// 原始list.size是10

sideEffectMethod(list);

// 此时list.size=???

void sideEffectMethod(List<A> list) {
    // do update list
}

```

随着时光流逝，嵌套深不见底，引用无处不在，灾难一触即发。
堆越界（世界第一大内存安全问题MSRC）、内存泄漏、使用已释放内存（世界第二大内存安全问题）就找上门了。

过去几年里见过很多祖传代码，堆到不能再堆，只能被套牢；我自己也踩过无数的故障就是因为当初的懒惰和从心（怂；

变化，尤其是莫名其妙的变化，我视为日常搬砖的万恶之源。

> 如实讲，当今大部分后端代码已经不如大前端界高级，Typescript、React引领了正确的方向。
>
> Rust索性大变革，所有权+生命周期加持，默认immutable，想变还得靠mut
>
> Haskell世界想做个mutable还挺费劲



## 言归正传

immutable到底有什么好？

- 数据不会在我们背后改变
- 没有隐含的副作用（side effects）
- 线程安全
- 引用透明/缓存性
- 敢于重构

> 当然，会有很多讨论关于性能的浪费，但现代语言编译器做的优化非常好



抛一个问题，Java的`final`关键字是不可变吗？

乍一看，听起来像immutable，但从更广泛的意义上说，它确实不是；它只能确保变量始终指向内存地址不变，它没有说明内存内容本身；

```java
```
