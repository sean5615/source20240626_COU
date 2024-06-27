<%/*
----------------------------------------------------------------------------------
File Name		: cou002m_02v1
Author			: Jason
Description		: COU002M_登錄年度預定開設課程 - 編輯顯示頁面
Modification Log	:

Vers		Date       	By            	Notes
--------------	--------------	--------------	----------------------------------
0.0.1		096/09/19	Jason    	Code Generate Create
----------------------------------------------------------------------------------
*/%>
<%@ page contentType="text/html; charset=UTF-8" errorPage="/utility/errorpage.jsp" pageEncoding="MS950"%>
<%@ include file="/utility/header.jsp"%>
<%@page import="com.acer.db.*,com.nou.aut.*,java.util.Vector"%>
<%
//學類
String sql = "SELECT "+
			 "DISCIPLINE_CODE AS SELECT_VALUE,DISCIPLINE_NAME AS SELECT_TEXT FROM COUT100 A "+
			 "WHERE A.FACULTY_CODE = '[FACULTY_CODE]' ";
			 
session.setAttribute("COU002M_07_SELECT", "COU#"+sql+" AND A.DISCIPLINE_TYPE = '1' ORDER BY SELECT_VALUE ");
//領域
session.setAttribute("COU002M_08_SELECT", "COU#"+sql+" AND A.DISCIPLINE_TYPE = '2' ORDER BY SELECT_VALUE ");
//教學面授方式
session.setAttribute("COU002M_09_SELECT", "COU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND = 'TEACHING_TYPE' ORDER BY CODE");
//教學面授方式名稱
session.setAttribute("COU002M_10_SELECT", "COU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND = 'TEACHING_TYPE_NAME' ORDER BY CODE");
//非本校製作媒體名稱
session.setAttribute("COU002M_11_SELECT", "COU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND = 'OTHER_MEDIA_TYPE' ORDER BY CODE");

com.nou.aut.AUTGETRANGE getCheck = (com.nou.aut.AUTGETRANGE)session.getAttribute("AUTGETRANGE");
String user_id=(String)session.getAttribute("USER_ID");
Vector checkVt=new Vector();	
String check="0"; //檢查註記
String dep_code="";
String center_code = "";
//檢查是不是課務組
checkVt=getCheck.getDEP_CODE("3","3");
for (int i = 0; i < checkVt.size(); i++){	
	dep_code=(String)checkVt.get(i);
	if(dep_code==null||dep_code.equals("513")){
		check="1";	
	}
	if(check.equals("1")){
		break;
	}
}
//檢查是不是學系
if("".equals(dep_code)){
	checkVt = getCheck.getDEP_CODE("2","3");
	for (int i = 0; i < checkVt.size(); i++){	
		dep_code=(String)checkVt.get(i);
		check="2";	
		if(check.equals("2")){
			break;
		}
	}
}
%>
<html>
<head>
	<%@ include file="/utility/viewpageinit.jsp"%>
	<script src="<%=vr%>script/framework/query1_2_0_2.jsp"></script>
	<script src="cou002m_02c1.jsp"></script>
	<noscript>
		<p>您的瀏覽器不支援JavaScript語法，但是並不影響您獲取本網站的內容</p>
	</noscript>
</head>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="背景圖" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- 定義按鈕起始 -->
<form name='EDIT1'>
	<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
		<tr class="mtbGreenBg">
			<td align=center>
				<div id="menu_btn">
					<input type=button name="C11_BTN" class="btn" value='登錄相同科目關連' onkeypress='doCout00("11");'onclick='doCout00("11");'>
					<input type=button name="C12_BTN" class="btn" value='登錄先修科目關連' onkeypress='doCout00("12");'onclick='doCout00("12");'>
					<input type=button name="C05_BTN" class="btn" value='課程管控時間' onkeypress='doCout00("5");'onclick='doCout00("5");'>
					<input type=button name="C17_BTN" class="btn" value='課程簡介資料' onkeypress='doCout00("17");'onclick='doCout00("17");'>
					<input type=button name="C18_BTN" class="btn" value='課程對應課程地圖' onkeypress='doCout00("18");'onclick='doCout00("18");'>
					<input type=button name="C03_BTN" class="btn" value='登錄教策小組名單' onkeypress='doCout00("3");'onclick='doCout00("3");'>
					<input type=button name="C09_BTN" class="btn" value='輔助教學設備需求資料' onkeypress='doCout00("9");'onclick='doCout00("9");'>
					<input type=button name="C109_BTN" class="btn" value='列印課程開設科目課程大綱' onkeypress='doCout00("109");'onclick='doCout00("109");' STYLE="display:none">
				</div>
			</td>
		</tr>
	</table>
</form>
<!-- 定義按鈕結束 -->
<!-- 定義編輯的 Form 起始 -->
<form name="EDIT" method="post" onsubmit="doSave();" style="margin:5,0,0,0;">
	<input type=hidden name="control_type">    
	<input type=hidden name="ROWSTAMP">
	<input type=hidden name="MODE">
	<input type=hidden name="SMS_NAME">
	<input type=hidden name="THISAYEAR">
	<input type=hidden name="THISSMS">
	<input type=hidden name="OPEN1">
	<input type=hidden name="CNEW_REWORK">
	<input type=hidden name="DATA_LOCK">
	<input type=hidden name="DEP_CHECK" value="<%=check%>">
		

	<!-- 編輯全畫面起始 -->
	<TABLE id="EDIT_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="排版用表格">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="排版用圖示" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="排版用圖示" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="排版用圖示" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="排版用圖示">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#FFFFFF">
				<!-- 按鈕畫面起始 -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
					<tr class="mtbGreenBg">
						<td align=left>【編輯畫面】- <span id='EditStatus'>新增</span><font color=purple size=3>　　※請學系同仁務必檢核<font color=red>紅色＊</font><font color=purple>欄位是否確實輸入，以避免相關報表無法列印之問題發生！！</font></td>
						<td align=right>
							<div id="edit_btn">
								<input type=button class="btn" value='回查詢頁' onkeypress='doBack();'onclick='doBack();'>
								<input type=button name="ADD_BTN" class="btn" value='新  增' onkeypress='doAdd();'onclick='doAdd();'>
								<input type=button class="btn" value='清  除' onkeypress='doClear();'onclick='doClear();'>
								<input type=submit name="SAVE_BTN" class="btn" value='存  檔'>
							</div>
						</td>
					</tr>
				</table>
				<!-- 按鈕畫面結束 -->

				<!-- 編輯畫面起始 -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
					<tr>
						<td align='right' class='tdgl1'>學年期<font color=red>＊</font>：</td>
						<td class='tdGrayLight'>
							<input type=text name='AYEAR' onblur="chkCrsnoInCout001();">
							<select name='SMS' onchange="chkCrsnoInCout001();">
							<option value=''>請選擇</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "SMS");</script>
							</select>
						</td>
						<td align='right' class='tdgl1'>科目代碼<font color=red>＊</font>：</td>
						<td class='tdGrayLight'>
							<input type='text' Column='CRSNO' name='CRSNO' onblur='Form.blurData("COU002M_01_BULR", "CRSNO,FACULTY_CODE", this.value+","+Form.getInput("EDIT","FACULTY_CODE"), ["CRS_NAME", "CRD"], [_i("EDIT", "CRS_NAME"), _i("EDIT", "CRD")], true);chkCrsnoInCout001();getCout002();'>
							<img id="img1" type="image" src='/images/select.gif' alt='開窗選取' style='cursor:hand' onkeypress='Form.openPhraseWindow("COU002M_01_WINDOW", "FACULTY_CODE", Form.getInput("EDIT","FACULTY_CODE"), "科目代號, 科目名稱, 學分數", [_i("EDIT", "CRSNO"), _i("EDIT", "CRS_NAME"), _i("EDIT", "CRD")]);chkCrsnoInCout001();getCout002();' onclick='Form.openPhraseWindow("COU002M_01_WINDOW", "FACULTY_CODE", Form.getInput("EDIT","FACULTY_CODE"), "科目代號, 科目名稱, 學分數", [_i("EDIT", "CRSNO"), _i("EDIT", "CRS_NAME"), _i("EDIT", "CRD")]);chkCrsnoInCout001();getCout002();'>
							<input type=text Column='CRS_NAME' name='CRS_NAME' readonly>
						</td>
						<td align='right' class='tdgl1' >
							面授類別<font color=red>＊</font>：<br>
							多次面授開班：
						</td>	
						<td class='tdGrayLight'>
							<select name='CRS_TYPE' onchange="chkCrstype();">
								<option value=''>請選擇</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "CRS_TYPE");</script>
							</select>
							<br>
							<select name='OPEN3' >
								<option value='N'>否</option>
								<option value='Y'>是</option>
							</select>
						</td>            			
					</tr>
					<tr>
						<td align='right' class='tdgl2'>學分<font color=red>＊</font>：</td>
						<td class='tdGrayLight'><input type='text' Column='CRD' name='CRD'></td>
						<td align='right' class='tdgl2'>開課學系<font color=red>＊</font>：</td>
						<td class='tdGrayLight'>
							<select name='FACULTY_CODE' onclick = "setDynSelect();">
								<script>Form.getSelectFromPhrase("COU002M_02_SELECT", null, null);</script>
							</select>
						</td>
						<td align='right' class='tdgl2'>續新修訂<font color=red>＊</font>：</td>
						<td class='tdGrayLight'>
							<select name='NEW_REWORK' >
								<option value=''>請選擇</option>
								<script>Form.getSelectFromPhrase("COU002M_06_SELECT", "KIND", "NEW_REWORK");</script>
							</select>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>共同開設學系：</td>
						<td class='tdGrayLight'>
							<select name='COMMON_FACULTY_CODE'>
								<option value=''>請選擇</option>
								<script>Form.getSelectFromPhrase("COU002M_04_SELECT", null, null);</script>
							</select>
						</td>
                        <td align='right' class='tdgl2'>計劃學系<font color=red>＊</font>：</td>
						<td class='tdGrayLight'>
							<select name='PLAN_FACULTY_CODE'>
								<script>Form.getSelectFromPhrase("COU002M_02_SELECT", null, null);</script>
							</select>
						</td>
						<td align='right' class='tdgl2'  >再製類別：<br>舊科目(最後開課)代碼：</td>
						<td class='tdGrayLight'>
							<select name='NEW_REWORK_KIND'>
								<option value=''>請選擇</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "NEW_REWORK_KIND");</script>
							</select>
							<br>
							<input type='text' Column='BEFORE_CRSNO' name='BEFORE_CRSNO' onblur='Form.blurData("COU002M_07_BULR", "CRSNO", this.value, ["CRS_NAME"], [_i("EDIT", "BEFORE_CRS_NAME")], true);'>
							<img id="img2" type="image" src='/images/select.gif' alt='開窗選取' style='cursor:hand' 
							onkeypress='Form.openPhraseWindow("COU002M_07_WINDOW", "BEFORE_CRSNO,BEFORE_CRS_NAME", _i("EDIT", "BEFORE_CRSNO").value+ "," +_i("EDIT", "BEFORE_CRS_NAME").value, "科目代號, 科目名稱", [_i("EDIT", "BEFORE_CRSNO"), _i("EDIT", "BEFORE_CRS_NAME")]);' 
							onclick='Form.openPhraseWindow("COU002M_07_WINDOW", "BEFORE_CRSNO,BEFORE_CRS_NAME", _i("EDIT", "BEFORE_CRSNO").value+ "," +_i("EDIT", "BEFORE_CRS_NAME").value, "科目代號, 科目名稱", [_i("EDIT", "BEFORE_CRSNO"), _i("EDIT", "BEFORE_CRS_NAME")]);'
							>
							<input type=text Column='BEFORE_CRS_NAME' name='BEFORE_CRS_NAME' readonly>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>領域<font color=red>＊</font>：</td>
						<td class='tdGrayLight' >
						    <select name='FIELD_CODE'>
							     <option value=''>請選擇</option>
						    </select>
						</td>	
						<td align='right' class='tdgl1'>課程難度易<font color=red>＊</font>：</td>
						<td class='tdGrayLight'>
							<select name='CRS_CHAR'>
								<option value=''>請選擇</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "CRS_CHAR");</script>
							</select>
						</td>
						<td align='right' class='tdgl1'>開課狀態：</td>
						<td class='tdGrayLight'>
							<select name='CRS_STATUS'>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "CRS_STATUS");</script>
							</select>
						</td>                        			
					</tr>
					<tr>
						<td align='right' class='tdgl2'>考試選課方式<font color=red>＊</font>：</td>
						<td class='tdGrayLight'  colspan='1'>			
							期中考
							<select name='EXAM_MK_MID' id='exam_mk_mid'>
								<option value=''>請選擇</option>
								<option value='Y'>統一命題集中考試(九宮格選課)</option>
								<option value='M'>統一命題非集中考試(九宮格選課)</option>
								<option value='N'>非統一命題非集中考試(多選課程全遠距微學分)</option>
							</select><br>
							期末考
							<select name='EXAM_MK' id='exam_mk'>
								<option value=''>請選擇</option>
								<option value='Y'>統一命題集中考試(九宮格選課)</option>
								<option value='M'>統一命題非集中考試(九宮格選課)</option>
								<option value='N'>非統一命題非集中考試(多選課程全遠距微學分)</option>
							</select>
						</td>
						<td align='right' class='tdgl2'>科目必選修：</td>
						<td class='tdGrayLight'>
							<select name='REQOPTION_TYPE'>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "REQOPTION");</script>
							</select>
						</td>
						<td align='right' class='tdgl2'>預估選課人數：</td>
						<td class='tdGrayLight'  colspan = "1"><input type=text name='EVAL_ST_NUM'></td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>面授次數<font color=red>＊</font>：</td>
						<td class='tdGrayLight'><input type=text name='TUT_TIMES'></td>					
						<td align='right' class='tdgl1'>實習次數(含電腦)<font color=red>＊</font>：</td>
						<td class='tdGrayLight'><input type=text name='LAB_TIMES'></td>
						<td align='right' class='tdgl1'>播授講次<font color=red>＊</font>：</td>
						<td class='tdGrayLight'><input type=text name='CRS_TIMES'></td>						
					</tr>
					<tr>
                        <td align='right' class='tdgl2'>原書字數(修訂)：</td>
						<td class='tdGrayLight'><input type=text name='ORI_TEXT_NUM'></td>					
                        <td align='right' class='tdgl2'>預計修訂字數(修訂)：</td>
						<td class='tdGrayLight'><input type=text name='MOD_TEXT_NUM'></td>						
						<td align='right' class='tdgl2'>使用電腦上機次數：</td>
						<td class='tdGrayLight'><input type=text name='ON_PC_NUM'></td>						
					</tr>
					<tr>
						<td align='right' class='tdgl1'>學類<font color=red>＊</font>：</td>
						<td class='tdGrayLight' >
							<select name='DISCIPLINE_CODE'>
								<option value=''>請選擇</option>
							</select>						
						<td align='right' class='tdgl1'>每學分每學期面授時數：</td>
						<td class='tdGrayLight'><input type='text'  name='CRD_HR' ></td> 
						<td align='right' class='tdgl1'>教科書：</td>
						<td class='tdGrayLight'>
							<select name='CRS_BOOK' id='crs_book1'>
                      			<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "CRS_BOOK");</script>
                  			</select>
              			</td>
					</tr>
			
					<tr>
						<td align='right' class='tdgl2'>保留講次：</td>
						<td class='tdGrayLight' colspan='3'><textarea name='RESERVE_ITEM' cols="70%" rows="2"></textarea></td>
						<td align='right' class='tdgl1'>教學面授方式<font color=red>＊</font>：</td>
						<td class='tdGrayLight' colspan='1'>
							<select name='TEACHING_TYPE'>
								<option value=''>請選擇</option>
								<script>Form.getSelectFromPhrase("COU002M_09_SELECT", null, null);</script>
							</select>
						</td>					
					</tr>
					<tr>
						<td align='right' class='tdgl1'>修訂講次：</td>
						<td class='tdGrayLight' colspan='3'><textarea name='REWORK_ITEM' cols="70%" rows="2"></textarea></td>
						<td align='right' class='tdgl1'>教學面授方式名稱<font color=red>＊</font>：</td>
						<td class='tdGrayLight' colspan='1'>
							<select name='TEACHING_TYPE_NAME'>
								<option value=''>請選擇</value>
								<script>Form.getSelectFromPhrase("COU002M_10_SELECT", null, null);</script>
							</select>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>使用媒體說明<font color=red>＊</font>：</td>
						<td class='tdGrayLight' colspan='1'>
							<select name='PRODUCE_TYPE_CHOOSE'>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "PRODUCE_CHOOSE");</script>
							</select>
							<input type=button class="btn" name='BTN_PRODUCE1' id='BTN_PRODUCE1' value='引用' onkeypress='doPRODUCE_TYPE("1");' onclick='doPRODUCE_TYPE("1");'>
							<input type=button class="btn" name='BTN_PRODUCE2' id='BTN_PRODUCE2' value='移除' onkeypress='doPRODUCE_TYPE("2");' onclick='doPRODUCE_TYPE("2");'>
							<input type=text name='PRODUCE_TYPE' readonly>
						</td>
						<td align='right' class='tdgl2'>使用非本校媒體說明<font color=red></font>：</td>
						<td class='tdGrayLight' colspan='1'>
							<select name='OTHER_MEDIA_TYPE'>
								<option value=''>請選擇</value>
								<script>Form.getSelectFromPhrase("COU002M_11_SELECT", null, null);</script>
							</select>
						</td>
                        <td align='right' class='tdgl1'><font color=red>資料是否匯出至<BR>課程地圖網站？</font></td>
						<td class='tdGrayLight' colspan='1'>
							<select name='MAP_EXPORT_MK'>
                          		<option value='Y'>是</option>
                          		<option value='N'>否</option>
                            </select>
						</td>	
					</tr>
					<tr>
						<td align='right' class='tdgl1'>是否控管中心<BR>可選課人數？<font color=red>*</font></td>
						<td align='left' valign = 'middle' colspan='3'>
							<input type='radio' value='N' name='IS_CTROREG'  onclick='changeTextStatus(\"CLOSE\");' checked>否。
							<input type='radio' value='Y' name='IS_CTROREG' onclick='changeTextStatus(\"OPEN\");'>是，控管條件說明：<br>
							<textarea rows='2' cols='80%' name='CTROREG_MK' ></textarea>&nbsp;
						</td>
						<td align='right' class='tdgl1'>選課畫面課程提示說明<BR>最多限30字<font color=red></font></td>
						<td align='left' valign = 'middle' colspan='1'>
							僅呈現於可多選課程及微學分數課程<br>
							<textarea rows='2' cols='40%' name='REG_MK' ></textarea>&nbsp;
						</td>
					</tr>	
					<tr>
						<td align='right' class='tdgl1'>課程資料引用：</td>		
						<td class='tdGrayLight' colspan='5'><input type=button class="btn"  value='課程資料引用' onkeypress='doNEW_REWORK_1();' onclick='doNEW_REWORK_1();'>
						下列欄位可按此功能鍵,引用前一最新開課學年期資料
						</td>		
					</tr>						
					<tr>
						<td align='right' class='tdgl1'>修課規定：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="FIRSTCOU" cols="70%"></textarea>
						</td>
					</tr>					
					<tr>
						<td align='right' class='tdgl1'>教師學術領域：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="TCH_ACADFIELD" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>學科委員學術領域：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="PRO_ACADFIELD" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>本課程與學系目標關聯性：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="DISCIPLINE_TARGET" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>本校已開之相關課程說明：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="OPENED_DESCRIPTION" cols="70%"></textarea>
						</td>
					</tr>
					<tr style= 'display:none'>
						<td align='right' class='tdgl1'>其他：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="OTHER" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>須具基礎知識：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="BASIC_KNWLDG" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>課程概要(計畫)：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="CRS_GUTLINE" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>課程概要(簡介)：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="CRS_OUTLINE" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>課程目標(計畫)：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="TUT_TARGET" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>課程目標(簡介)：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="TUT_TARGET_INTRODUCTION" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>教課書章節：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="CRS_BOOK_CHAPTER" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>課程大綱備註：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="RMK" cols="70%"></textarea>
						</td>
					</tr> 
					<tr>
						<td align='right' class='tdgl1'>備註(修訂)：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="MOD_RMK" cols="70%"></textarea>
						</td>
					</tr> 
					<tr>
						<td align='right' class='tdgl2'>參考書目：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="BIBLIOGRAPHY" cols="70%"></textarea>
						</td>
					</tr> 
					<tr>
						<td align='right' class='tdgl1'>評量方式：</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="EVAL_MANNER" cols="70%"></textarea>
						</td>
					</tr> 
				</table>
				<!-- 編輯畫面結束 -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="排版用圖示">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="排版用圖示" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="排版用圖示" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="排版用圖示" width="13" height="15"></td>
		</tr>
	</table>
	<!-- 編輯全畫面結束 -->
</form>
<!-- 定義編輯的 Form 結束 -->

<!-- 標題畫面起始 -->
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="排版用表格">
	<tr>
		<td>
			<table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="<%=vr%>images/ap_index_title.jpg" alt="排版用圖示">
						　　<span class="title">COU002M_維護學期開課計畫</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- 標題畫面結束 -->

<!-- 定義編輯的 Form 起始 -->
<form name="VIEW" method="post" style="margin:5,0,0,0;">
	<input type=hidden name="control_type">
	<input type=hidden name='AYEAR'>
	<input type=hidden name='SMS'>
	<input type=hidden name='CRSNO'>

	<!-- 編輯全畫面起始 -->
	<TABLE width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="排版用表格">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="排版用圖示" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="排版用圖示" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="排版用圖示" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="排版用圖示">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#FFFFFF">
				<!-- 按鈕畫面起始 -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
					<tr class="mtbGreenBg">
						<td align=left>開課相關資訊參考</td>
						<td align=right>
						</td>
					</tr>
				</table>
				<!-- 按鈕畫面結束 -->

				<!-- 編輯畫面起始 -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
					<tr>
						<td align='center' class='tdgl1' width='20%' rowspan=2>
							歷年開課狀況<br>
							<input type=button name="HISTORY_COU_BTN" class="btn" value='取得歷年開課狀況' onkeypress='doHistory();'onclick='doHistory();'>
						</td>
						<td align='right' class='tdgl1' width='10%'>學年期</td>
						<td id='ayearsms0' class='tdGrayLight' width='17%'>&nbsp;</td>
						<td id='ayearsms1' class='tdGrayLight' width='17%'>&nbsp;</td>
						<td id='ayearsms2' class='tdGrayLight' width='17%'>&nbsp;</td>
						<td id='ayearsms3' class='tdGrayLight' width='17%'>&nbsp;</td>
					</tr>	
					<tr>					
						<td align='right' class='tdgl1'>選課人數</td>
						<td id='stu_num0' class='tdGrayLight'>&nbsp;</td>
						<td id='stu_num1' class='tdGrayLight'>&nbsp;</td>
						<td id='stu_num2' class='tdGrayLight'>&nbsp;</td>
						<td id='stu_num3' class='tdGrayLight'>&nbsp;</td>
					</tr>					
					<tr>					
						<td align='right' class='tdgl2'>先修科目：</td>
						<td id='info1' class='tdGrayLight' colspan=5>&nbsp;</td>
					</tr>
					<tr>					
						<td align='right' class='tdgl1'>相同科目：</td>
						<td id='info2' class='tdGrayLight' colspan=5>&nbsp;</td>
					</tr>
					<tr>					
						<td align='right' class='tdgl2'>課程大綱(舊課程)：</td>
						<td id='info3' class='tdGrayLight' colspan=5>&nbsp;</td>
					</tr>
					<tr>					
						<td align='right' class='tdgl1'>教策小組名單：</td>
						<td id='info4' class='tdGrayLight' colspan=5>&nbsp;</td>
					</tr>					
				</table>
				<!-- 編輯畫面結束 -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="排版用圖示">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="排版用圖示" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="排版用圖示" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="排版用圖示" width="13" height="15"></td>
		</tr>
	</table>
	<!-- 編輯全畫面結束 -->
</form>
<!-- 定義編輯的 Form 結束 -->

<!-- 定義編輯的 Form 起始 -->
<form name="VIEW2" method="post" style="margin:5,0,0,0;">
	<input type=hidden name="control_type">
	<!--主要參數-->
	<input type=hidden name='AYEAR'>
	<input type=hidden name='SMS'>
	<input type=hidden name='CRSNO'>
	<!--次要參數-->	
	<input type=hidden name='FACULTY_CODE'>
	<input type=hidden name='CRS_NAME'>
	<input type=hidden name='CRD'>
	<input type=hidden name='REQOPTION_TYPE'>
	<input type=hidden name='NEW_REWORK'>
	<input type=hidden name='PRODUCE_TYPE'>
	<input type=hidden name='CRS_TIMES'>

	<!-- 編輯全畫面起始 -->
	<TABLE id='imsuperman' width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="排版用表格">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="排版用圖示" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="排版用圖示" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="排版用圖示" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="排版用圖示">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#FFFFFF">
				<!-- 按鈕畫面起始 -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
					<tr class="mtbGreenBg">
						<td align=left>停開/延開作業</td>
						<td align=right>
						</td>
					</tr>
				</table>
				<!-- 按鈕畫面結束 -->

				<!-- 編輯畫面起始 -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="排版用表格">
					<tr>
						<td align='right' class='tdgl1' width='20%'>停開：</td>
						<td class='tdGrayLight'>
							<input type=button name="STOP_BTN" class="btn" value='停  開' onkeypress='doStop();'onclick='doStop();'>
							<font color=red size='1px'>此作業執行後，將會停止該科目的所有作業，如需還原，需透過課務組行政人員，請三思後行!</font>
						</td>
					</tr>	
					<tr>
						<td align='right' class='tdgl2' width='20%'>延開：</td>
						<td class='tdGrayLight'>
							<input type=text name='D_AYEAR'>
							<select name='D_SMS'>
								<option value=''>請選擇</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "SMS");</script>
							</select>						
							<input type=button name="DELAY_BTN" class="btn" value='延  開' onkeypress='doDelay();'onclick='doDelay();'>
						</td>
					</tr>					
				</table>
				<!-- 編輯畫面結束 -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="排版用圖示">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="排版用圖示" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="排版用圖示" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="排版用圖示" width="13" height="15"></td>
		</tr>
	</table>
	<!-- 編輯全畫面結束 -->
</form>
<!-- 定義編輯的 Form 結束 -->

<form name="PRINT" method="post">
	<input type=hidden name="AYEAR">
	<input type=hidden name="SMS">
	<input type=hidden name="CRSNO">
	<input type=hidden name="OPEN" value="OPEN1">
	<input type=hidden name="RMK">
</form>

<script>
	document.write ("<font color=\"white\">" + document.lastModified + "</font>");
	window.attachEvent("onload", page_init);
	window.attachEvent("onload", onloadEvent);	
</script>
</body>
</html>
