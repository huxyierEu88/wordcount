<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" type="text/css" href="/css/themes/metro/easyui.css">
   <link rel="stylesheet" type="text/css" href="/css/themes/icon.css">
   <link rel="stylesheet" type="text/css" href="/css/demo.css">
   <link rel="stylesheet" type="text/css" href="/css/jquery.pagewalkthrough.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery.serializejson.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>

<script type="text/javascript" src="/js/jquery.pagewalkthrough.min.js"></script>
<script type="text/javascript" src="/js/html5.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript">
window.contextPath = '<%=basePath%>';
window.systemTreeUrl = 'dataStoreAnalysis/getAllSystem';
window.systemDetailUrl = 'dataStoreAnalysis/getSystemDetail';
window.executeUrl = 'executor/doExecute';
window.refreshStatusUrl = 'executor/refreshStatus';
window.updateEnvironmentUrl = 'updateData/updateEnvironment';
window.saveSystemUrl = 'updateData/saveSystem';
window.editSystemUrl = 'updateData/editSystem';
window.deleteSystemEnvironmentUrl = 'updateData/deleteSystemEnvironment';
window.deleteSystemUrl = 'updateData/deleteSystem';
window.downloadUserManualUrl = 'dataStoreAnalysis/downloadUserManual';


</script>
<title>脚本自动执行工具</title>
</head>

<style type="text/css">
.tripform-group{
	float:left;
	border:1px solid #95B8E7;
	height:22px;
	line-height:22px;
	border-radius:3px;
}
.trip-selected{
	background-color:#E4EEFF;
	color:#0E2D5F;
}
.trip-unselect{
	background-color:#F5F5F5;
	color:#999
}
#gitPathTypeBtn{
	border-radius:3px 0 0 3px;
}
#filePathTypeBtn{
	border-radius:0 3px 3px 0;
}
#gitPathTypeBtn,#filePathTypeBtn{
	float:left;
	padding:0 10px;
	cursor:pointer;
	letter-spacing: 3px;
}
.trip-selected{
	background-color:#E4EEFF;
	color:#0E2D5F;
}
.trip-unselect{
	background-color:#F5F5F5;
	color:#999
}
.tripform-group .tripform-title{
	display:block;
	float:left;
	background-color:#F5F5F5; 
	border-right:1px solid #95B8E7;
	padding:0 15px;
	border-radius:3px 0 0 3px;
}
a{ color:#30F; text-decoration:none;}
a:hover{ color:#F00; text-decoration:underline;}
a:active{ color:#30F;}
</style>
<body class="easyui-layout">

<div data-options="region:'north'" style="height:80px"><h1 align="center">脚本自动执行工具</h1>
<div align="right" style="color: "><a href="${contextPath }dataStoreAnalysis/downloadUserManual" target="_blank">用户手册</a></div>
</div>
<div data-options="region:'center',split:true" >
<div align="center">
<fieldset style="border: 1px solid #95B8E7;">
			<legend
				style="font: bold 12px verdana, helvetica, arial, sans-serif; color: #95B8E7;">系统基本信息</legend>
 <table width="80%" >
 	<tr>
 	 <td width="15%" align="right">系统：</td>
 	 <td ><span id="systemCode"></span></td>
 	 <td width="15%" align="right">路径类型：</td>
 	 <td><span id="pathType"></span></td>
 	</tr>
 	<tr>
 	 <td align="right" ><span id="pathAddressTitle">GIT地址：</span></td>
 	 <td colspan="3"><span id="pathAddress"></span></td>
 	</tr>
 	<tr id="gitTr1">
 	 <td align="right">分支：</td>
 	 <td ><span id="gitBranch"></span></td>
 	 <td align="right">sql路径：</td>
 	 <td ><span id="sqlPath"></span></td>
 	</tr>
 	<tr id="gitTr2">
 	 <td width="15%" align="right">用户名：</td>
 	 <td ><span id="gitUserName"></span></td>
 	 <td width="15%" align="right">密码：</td>
 	 <td><span id="gitPassword"></span></td>
 	</tr>
 </table>
 </fieldset>
</div>
<div align="center">
    <table id="dg"   style="width:99.7%;height:auto">
       
    </table>
 
    <div id="tb" style="height:auto">
     	<span id="buttonSpan">
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">新增环境</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="removeEnvironment" onclick="removeEnvironment()">删除环境</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" id="accept" onclick="accept()">接受</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" id="reject" onclick="reject()">放弃</a>
	    </span>
	    <span id="executeSpan">
	        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" id="execute" onclick="execute()">执行</a>
   		</span>
    </div>
    <div id="failResonWin"></div>
    <div class="easyui-dialog" id="systemPanel" style="width:600px;height:300px" data-options = "modal:true">
		<form action="<%=basePath%>updateData/saveSystem" id="addSystemForm" method="post" enctype="multipart/form-data">
			<table width="100%" style="margin-top: 30px">
				<tr style="margin-top: 10px">
					<td align="right" width="15%">系统：</td>
					<td width="35%"><input class="easyui-textbox" type="text" name="systemCode" id="systemCodeTree" data-options="required:true,missingMessage:'此项必填',prompt:'系统对应的代码，如RPS'" /> </td>
					<td align="right" width="15%">路径类型：</td>
					<td width="35%">
						<div class="tripform-group" style="">
							<div id="gitPathTypeBtn" class="trip-selected">GIT</div>
							<div style="float:left;width:1px;height:100%;background-color:#95B8E7;"></div>
							<div id="filePathTypeBtn" class="trip-unselect">文件</div>
							<input type="hidden" id="pathTypeTree" name="pathType" value="git">
						</div>
					</td>
				</tr>
				<tr style="margin-top: 10px;" id="gitUserNameTr">
					<td align="right">用户名：</td>
					<td ><input class="easyui-textbox" type="text" name="gitUserName" id="gitUserNameTree"  data-options="required:true,missingMessage:'此项必填',prompt:'GIT的用户名，一般为工号'"/></td>
					<td align="right">密码：</td>
					<td><input class="easyui-textbox" type="password" name="gitPassword" id="gitPasswordTree" data-options="required:true,missingMessage:'此项必填',prompt:'GIT的密码，一般为域密码'"/></td>
				</tr>
				
				<tr style="margin-top: 10px" id="gitBranchTr">
					<td align="right">分支：</td>
					<td><input class="easyui-textbox" type="text" name="gitBranch" id="gitBranchTree"  data-options="required:true,missingMessage:'此项必填',prompt:'需要执行哪个分支的脚本'"/></td>
					<td align="right">sql路径：</td>
					<td><input class="easyui-textbox" type="text" name="sqlPath" id="sqlPathTree" data-options="required:true,missingMessage:'此项必填',prompt:'脚本所在的路径，如db/sql'"/></td>
				</tr>
				<tr style="margin-top: 50px" id="gitPathAddressTr">
					<td align="right" >GIT地址：</td>
					<td colspan="3"><input class="easyui-textbox" type="text" name="pathAddress" id="gitPathAddress" data-options="required:true,missingMessage:'此项必填',width:470,validType:'endWith[\'.git\']',prompt:'克隆代码时的那个地址，以.git结尾'" /></td>
				</tr>
				<tr style="margin-top: 50px;display:none" id="filePathAddressTr">
					<td align="right" >上传路径：</td>
					<td colspan="3"><input class="easyui-filebox" type="text" name="filePathAddress" id="filePathAddress" data-options="required:true,missingMessage:'此项必填',width:470,buttonText:'请选择文件',prompt:'请上传.zip或.rar的压缩文件'" /></td>
				</tr>
				
			</table>
		</form>
	</div>

</div>
    
</div>
<div data-options="region:'west',split:true"  title="系统" style="width:150px;" >
        <ul  id="systemTree" ></ul>
        <div id="addSystem" class="easyui-menu" style="width:120px;">
        	<div onclick="addSystem()" data-options="iconCls:'icon-add'">新增系统</div>
    	</div>
    	<div id="editSystem" class="easyui-menu" style="width:120px;">
        	<div onclick="toEditSystem()" data-options="iconCls:'icon-edit'">编辑</div>
        	<div onclick="removeSystem()" data-options="iconCls:'icon-remove'">删除</div>
    	</div>
</div>
</body>
<div id="walkthrough-content"> 
    <div id="walkthrough-1"> 
        欢迎使用<span style="font-size: 30px;font-weight: bold;">脚本自动执行工具</span> 
 
        <p>本工具能够自动执行提交到GIT中的脚本或者上传的脚本，并记录各环境当前执行的脚本索引，并支持下一版本继续执行</p> 
        <p>点击下一步了解更多...</p> 
    </div> 
 
    <div id="walkthrough-2"> 
        选中"系统"，单击右键可以添加系统哦，当选择具体的系统时，单击右键可以编辑和删除系统哦！
    </div> 
 
    <div id="walkthrough-3"> 
         <img alt="" src="/css/images/gitsystem.bmp">
         <p>添加系统相关信息，当路径类型选择"GIT"时，填写GIT相关信息，当路径类型选择"文件"时，请上传文件！</p>
    </div> 
 
    <div id="walkthrough-4"> 
        <p>给系统添加、删除数据库环境信息，双击环境可以编辑，点击"接受"表示接受修改内容，"放弃"表示放弃修改内容！</p>
    </div> 
 
    <div id="walkthrough-5"> 
        选中环境信息，可以选择多个环境的，点击"执行"，可同时自动执行各个环境脚本哦，如果执行过程中失败会自动停止。
        <p>详细操作请下载<a href="${contextPath }dataStoreAnalysis/downloadUserManual" target="_blank">用户手册</a></p>
    </div> 
</div> 
</html>