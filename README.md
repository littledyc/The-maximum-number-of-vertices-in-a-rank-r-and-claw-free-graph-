# The maximum number of vertices in a rank r and claw free graph

一个用来验证秩为r且claw-free的图为星补添点的最大点数的matlab程序

## 示例

在matlab中打开code文件夹,在命令行输入以下命令

```matlab
%初始化要计算最大点数图的邻接矩阵
A=[0 1 0 0;
1 0 0 0;
0 0 0 1;
0 0 1 0];
%计算以A加点到最多的邻接矩阵(cell数组格式)
B=maxpoint(A);
%去掉有复制点的图
C=notduplicatenodes(B);
```

如果你想验证点数为r且秩为r的所有图

```matlab
A=generateAllGraphs(n);
```
