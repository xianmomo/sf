<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/layout.jsp"%>
<body>
	<div style="padding: 10px 10px 0px 10px">
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'" onclick="tbSvnRespAddFormSubmit()">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-cancel'" onclick="tbSvnRespAddFormClear()">取消</a>
		</div>
		<form class="custom-form" id="tbSvnRespAdd_form">
			<label-title>库名称:</label-title>
			<label-value> 
				<input class="easyui-textbox" name="respName"/> 
			</label-value>
			<label-title>库类型:</label-title>
			<label-value> 
				<input type="radio"	name="respType" value="1"/> <span>系统库</span>
				<input type="radio"	name="respType" checked="checked" value="2"/> <span>管理库</span>
			</label-value>
		</form>
	</div>
	<script type="text/javascript">
		function tbSvnRespAddFormClear() {
			$("#"+$("#dialogId").val()).dialog("destroy");
		}
		function tbSvnRespAddFormSubmit(){
			top.ajaxSubmitForm({
				formId : "tbSvnRespAdd_form",
				url : "${pageContext.request.contextPath }/main/svn/saveTbSvnResp",
				success : function(data) {
					if (data.success) {
						top.messageAlert(true,"提交成功","");
						tbSvnRespAddFormClear();
						searchRepositoryDirShow();
					} else {
						top.messageAlert(false,"提交失败",data.msg);
					}
				}
			});
		}
	</script>
</body>
</html>