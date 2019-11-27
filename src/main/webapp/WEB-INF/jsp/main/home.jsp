<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	首页 拖拽 模块效果 
--%>

<div id="main_portal" >
	<div></div>
	<div></div>
</div>
	
<div style="display: none">
		<c:if test="${requestScope.affiche!=null }">
			<div id="p1" title="系统公告" collapsible="true">
				<table class="table table-bordered table-condensed table-striped center" style="width: 99%;margin: 3px auto;">
					<thead>
					<tr>
						<th align="center">标题</th>
						<th width="150">发送时间</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="afc" items="${requestScope.affiche }">
						<tr>
							<td title="${afc.afficheTitle }">
								<a href="affiche/show.do?id=${afc.id }" target="dialog" width="1000" height="450" title="系统公告详情" rel="home_xtgg_show">
									<c:if test="${afc.isTop==1}"><img src="resource/images/arrow_up.gif" style="margin-top: -3px;"/></c:if>
									<c:out value="${afc.afficheTitle }"/>
								</a>
							</td>
							<td>
								<fmt:formatDate value="${afc.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

			</div>
		</c:if>

		<c:if test="${requestScope.afficheDept !=null}">

			<div id="p2" title="部门公告">
				<table class="table table-bordered table-condensed table-striped center" style="width: 99%;margin: 3px auto;">
					<thead>
					<tr>
						<th align="center">标题</th>
						<th width="150">发送时间</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="afcd" items="${requestScope.afficheDept }">
						<tr>
							<td title="${afcd.afficheTitle }">
								<a href="affiche/dept/show.do?id=${afcd.id }" target="dialog" width="1000" height="450"
								   title="部门公告详情" rel="home_xtggdept_show">
									<c:if test="${afcd.isTop==1}"><img src="resource/images/arrow_up.gif" style="margin-top: -3px;"/></c:if>
									<c:out value="${afcd.afficheTitle }"/>
								</a>
							</td>
							<td>
								<fmt:formatDate value="${afcd.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

		</c:if>


		<c:if test="${ requestScope.meetings !=null }">

			<div id="p3" title="我的会议">
				<table class="table table-bordered table-condensed table-striped center" style="width: 99%;margin: 3px auto;">
					<thead>
					<tr>
						<th align="center">会议标题</th>
						<th width="150">会议日期</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="meet" items="${requestScope.meetings }">
						<tr>
							<td title="${meet.MName }">
								<a href="meeting/find.do?id=${meet.id }" target="dialog" width="1200" height="450" title="会议详情" rel="home_hy_find">
									<c:out value="${meet.MName }"/>
								</a>
							</td>
							<td>
								<fmt:formatDate value="${meet.MDate}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

		</c:if>

		<c:if test="${requestScope.news!=null }">

			<div id="p4" title="新闻">
				<table class="table table-bordered table-condensed table-striped center" style="width: 99%;margin: 3px auto;">
					<thead>
					<tr>
						<th align="center">新闻标题</th>
						<th width="150">发布时间</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="xw" items="${requestScope.news }">
						<tr>
							<td title="${xw.newstitle}"><a href="news/look.do?id=${xw.id}&rel=grbg_xw_look" target="navTab" rel="grbg_xw_look" title="新闻详情">${xw.newstitle}</a></td>
							<td title="${xw.createdtime}"><fmt:formatDate value="${xw.createdtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

		</c:if>
</div>


<script type="text/javascript">

//重置顺序,并刷新首页
function resetMainPortalState(){
	 Msg.confirm('提示',"确定重置首页内容显示顺序吗?", function(r){
         if (r){
        	 $.cookie('portal-state',null);
        	 $("#tab-mainPage").panel('refresh');
         }
	 });
}

var mainPortal;

$(function() {
	mainPanels =new Array();
	if($("#p1").length==1){
		mainPanels.push({
			id : 'p1',
			title : '系统公告',
			height : 220,
			collapsible : true,
			tools:[{
			       iconCls:'icon-search',
			       handler:function(){
			         MUI.openCenterTab('系统公告','affiche/load/my.do?rel=gtpt_xtgg','gtpt_xtgg',false,true)
			       }
			    }
			   ]
		});
	};
	if($("#p2").length==1){
		mainPanels.push({
			id : 'p2',
			title : '部门公告',
			height : 220,
			collapsible : true,
			tools:[{
			       iconCls:'icon-search',
			       handler:function(){
			         MUI.openCenterTab('部门公告','affiche/dept/load/my.do?rel=gtpt_bmgg','gtpt_bmgg',false,true)
			       }
			    }
			  ]
		});
	};
	
	if($("#p3").length==1){
		mainPanels.push({
			id : 'p3',
			title : '我的会议',
			height : 220,
			collapsible : true,
			tools:[{
			       iconCls:'icon-search',
			       handler:function(){
			         MUI.openCenterTab('我的会议','meeting/loadtome.do?rel=ggpt_hygl','ggpt_hygl',false,true)
			       }
			    }
			  ]
		});
	};
	if($("#p4").length==1){
		mainPanels.push({
			id : 'p4',
			title : '新闻',
			height : 220,
			collapsible : true,
			tools:[{
			       iconCls:'icon-search',
			       handler:function(){
			         MUI.openCenterTab('新闻','news/load_news.do?rel=grbg_xw','grbg_xw',false,true)
			       }
			    }
			  ]
		});
	};
	
	
	mainPortal = $('#main_portal').portal({
		border : false,
		fit : true,
		onStateChange : function() {
			$.cookie('portal-state', getPortalState(),{expires:7});
		}
	});
	var state = $.cookie('portal-state');
	if (!state) {
		state = 'p1,p3,:p2,p4';/*冒号代表列，逗号代表行*/
	}
	addPortalPanels(state);
	mainPortal.portal('resize');
	
});

function getPanelOptions(id) {
	for ( var i = 0; i < mainPanels.length; i++) {
		if (mainPanels[i].id == id) {
			return mainPanels[i];
		}
	}
	return undefined;
}
function getPortalState() {
	var aa = [];
	for ( var columnIndex = 0; columnIndex < 2; columnIndex++) {
		var cc = [];
		var panels = mainPortal.portal('getPanels', columnIndex);
		for ( var i = 0; i < panels.length; i++) {
			cc.push(panels[i].attr('id'));
		}
		aa.push(cc.join(','));
	}
	return aa.join(':');
}
function addPortalPanels(portalState) {

	var columns = portalState.split(':');
	for ( var columnIndex = 0; columnIndex < columns.length; columnIndex++) {
		var cc = columns[columnIndex].split(',');
		for ( var j = 0; j < cc.length; j++) {
			var options = getPanelOptions(cc[j]);
			if (options) {
				var p=$("#"+options.id);
				if(p.length>0){
					p.panel(options);
					mainPortal.portal('add', {
						panel : p,
						columnIndex : columnIndex
					});
				}
			}
		}
	}
}
</script>

