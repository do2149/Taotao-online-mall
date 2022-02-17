<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snack.model.Receiptinfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% Receiptinfo receiptinfo = (Receiptinfo)session.getAttribute("receiptinfo");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/car.css" rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/css/libs/sweetalert.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/libs/angular.min.js"></script>
</head>
<body ng-app="carApp">
<div class="span11">
		<div class="cart">
			<a  href="${pageContext.request.contextPath}/sorder/gotocar">购物车</a>
		</div>
		<div class="phone">
			电话热线:
			<strong>18300676700</strong>
		</div>
		<div class="weixin">
				<img src="${pageContext.request.contextPath}/image/trimImg/wxBZ.png" alt="微信图标" class="weixin-icon"/>
				微信服务:
				<strong id="yc" style="cursor:pointer;">点击扫码付款加微信</strong>
			    <img id="ewm" style="display:none;" src="${pageContext.request.contextPath}/image/trimImg/myEWM.png" alt="微信图标" class="weixin-ewm"/>
			             广告招租：
			    <strong>18300676700</strong>
			             
		</div>
</div>
<div class="container header">
	<div class="span5">
		<div class="logo">
				<img id="logoPic" src="${pageContext.request.contextPath}/image/trimImg/shopBZ.jpg" style="display: block;" alt="淘淘"/>
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
	<img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
</div>	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<c:if test="${sessionScope.frontuser==null}">
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a href="${pageContext.request.contextPath}/shop/userLoginGet">登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="${pageContext.request.contextPath}/user/userRegisterGet">注册</a>|
				</li>
				<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="${pageContext.request.contextPath}/admin/login/adminLogin" target="_blank">登录后台</a>|
				</li>
				</c:if>	
				<c:if test="${sessionScope.frontuser!=null}">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
					    <input id="pd" value="${sessionScope.frontuser}" type="hidden"/>
						<a href="javascript:void()">欢迎:${sessionScope.frontuser}</a>|
					</li>
				</c:if>	
				<li id="headerUsername" class="headerUsername"></li>
				<li id="headerLogout" class="headerLogout">
					<a>[退出]</a>|
				</li>
				       <c:if test="${sessionScope.frontuser!=null}">
						<li class="personalInfo">
							<a href="${pageContext.request.contextPath}/user/userPersonalInfo">会员中心</a>
							|
						</li>
						</c:if>
						<c:if test="${sessionScope.frontuser==null}">
						<li class="personalInfo">
							<a href="${pageContext.request.contextPath}/shop/userLoginGet">会员中心</a>
							|
						</li>
						</c:if>
			</ul>
		</div>

	</div>
	<div class="span24">
		<ul class="mainNav">
			<li>
				<a href="${pageContext.request.contextPath}/shop/index">首页</a>
				|
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/shop/puffingType?type=1">饰品类</a>
				|
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/shop/puffingType?type=2">零食类</a>
				|
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/shop/puffingType?type=3">日用品</a>
				|
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/shop/puffingType?type=6">进口类</a>
				|
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/shop/puffingType?type=4">文具类</a>
				|
			</li>
			<li>
				<a  href="${pageContext.request.contextPath}/sorder/gotocar">购物车</a>
				|
			</li>
		</ul>
	</div>
</div>

<div class="container car">
		<div class="span24">
		  <div ng-controller="carCtrl">
				<table>
					<tbody>
						<tr>
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
					<c:forEach items="${receiptinfo.orderdetailSet}" var="orderdetail">
						<tr>
							<td width="60">
								<input type="hidden" name="id" value="${orderdetail.snackinfo.sId}">
								<img src="${pageContext.request.contextPath}/image/${orderdetail.snackinfo.sPictureurl}">
							</td>
							<td>
								<a target="_blank"> ${orderdetail.snackinfo.sName}</a>
							</td>
							<td>
								￥${orderdetail.oMoney}
							</td>
							<td class="quantity" width="60">
								${orderdetail.oNum}
							</td>
							<td width="140">
								<span class="subtotal">￥${orderdetail.oMoney*orderdetail.oNum}</span>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/sorder/delete?sId=${orderdetail.snackinfo.sId}" class="delete" >删除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<c:if test="${sessionScope.receiptinfo==null}">
					<h1 style="margin: 50px 300px;">还没有添加商品！</h1>
				</c:if>
				<c:if test="${sessionScope.receiptinfo!=null}">
					<div class="total">
						<em id="promotion"></em>
							
						商品金额: <strong id="effectivePrice">￥${receiptinfo.oPhone}元</strong>
					</div>
					<div id="subBottom" class="bottom">
						<a href="${pageContext.request.contextPath}/sorder/clear" id="clear" class="clear">清空购物车</a>
						<span id="submit" class="submit">提交订单</span>
					</div>
				</c:if>
				
				<div id="carinfo" style="display: none">
					<form id="orderForm" action="${pageContext.request.contextPath}/forder/order" method="post">
					<input type="hidden" name="uid" value="${sessionScope.frontuserId}"/>
					<input type="hidden" name="total" value="	${forder.total}"/>
				
					<div class="span24">
						<p>
						收货人&nbsp;&nbsp;&nbsp;：<input id="oName" name="oName" type="text" value="" style="width:150px" />
												<span style="color:red" id="namemsg"></span>
									<br /> 
						联系方式：<input id="oPhone" name="oPhone" type="text" value="" style="width:150px" />
												<span style="color:red" id="phonemsg"></span>
						<br />
						收货地址：<input id="oAddress" name="oAddress" type="text" value="" style="width:150px" />
											<span style="color:red" id="addressmsg"></span>
									<br />
							</p>
							<hr />
							<p style="text-align:right">
								<a id="subCarButton" >
									<img src="${pageContext.request.contextPath}/image/finalbutton.gif" width="204" height="51" border="0" />
								</a>
							</p>
					</div>
				</form>
			</div>
			 <table id="tablePayExample"  style="width:100%;display: none;">
							<tr>
								<td>支付金额:<input type="hidden" id="payoId"></td>
								<td><input type="text" disabled="disabled" id="payNumber"></td>
							</tr>
							<tr>
								<td>您的钱包:</td>
								<td><input type="text" disabled="disabled" id="uMoney"></td>
							</tr>
							<tr>
								<td>输入密码:</td>
								<td><input type="password" id="uPasword"></td>
							</tr>
							<tr style="text-align: center;"><td colspan="2"><input type="button" id="comfirPay" value="付款"></td></tr>						
							
							<!-- 支付宝支付和会员支付二选一进行，会员支付要先进行充值 -->
							<tr>
								<td>支付宝支付:<input type="hidden" id="payoId"></td>
								<td> ${receiptinfo.oPhone}元</td>
							</tr>
							<tr style="text-align: right;">
							     <td><img src="${pageContext.request.contextPath}/image/zhifubao.jpg"  width="100" height="30"></td>
							</tr>
							<tr style="text-align: center;"><td colspan="2"><a href="${pageContext.request.contextPath}/pay_index.jsp?a=${receiptinfo.oPhone}" ><input type="button" id="comfirPay" value="支付宝付款"></a></tr>
				</table>

			</div>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="copyright">【淘淘】网上商城 版权所有</div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/car.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/productType.js"></script>
</body>
</html>