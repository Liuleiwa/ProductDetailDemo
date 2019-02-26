# 商品详情上拉图文详情 图文下拉商品详情

* 原理是

1. 底部放一个scrollView
2. ScrollView上放一个tableview和webview（根据需求）
3. 利用mjrefresh实现上拉和下拉的效果
4. 在上拉和下拉的回调方法里面改变底部scrollview的偏移量

![image](https://github.com/Liuleiwa/ProductDetailDemo/blob/master/ProductDetailDemo.gif)