<%/*
----------------------------------------------------------------------------------
File Name		: cou002m_02v1
Author			: Jason
Description		: COU002M_�n���~�׹w�w�}�]�ҵ{ - �s����ܭ���
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
//����
String sql = "SELECT "+
			 "DISCIPLINE_CODE AS SELECT_VALUE,DISCIPLINE_NAME AS SELECT_TEXT FROM COUT100 A "+
			 "WHERE A.FACULTY_CODE = '[FACULTY_CODE]' ";
			 
session.setAttribute("COU002M_07_SELECT", "COU#"+sql+" AND A.DISCIPLINE_TYPE = '1' ORDER BY SELECT_VALUE ");
//���
session.setAttribute("COU002M_08_SELECT", "COU#"+sql+" AND A.DISCIPLINE_TYPE = '2' ORDER BY SELECT_VALUE ");
//�оǭ��¤覡
session.setAttribute("COU002M_09_SELECT", "COU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND = 'TEACHING_TYPE' ORDER BY CODE");
//�оǭ��¤覡�W��
session.setAttribute("COU002M_10_SELECT", "COU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND = 'TEACHING_TYPE_NAME' ORDER BY CODE");
//�D���ջs�@�C��W��
session.setAttribute("COU002M_11_SELECT", "COU#SELECT CODE AS SELECT_VALUE, CODE_NAME AS SELECT_TEXT FROM SYST001 WHERE KIND = 'OTHER_MEDIA_TYPE' ORDER BY CODE");

com.nou.aut.AUTGETRANGE getCheck = (com.nou.aut.AUTGETRANGE)session.getAttribute("AUTGETRANGE");
String user_id=(String)session.getAttribute("USER_ID");
Vector checkVt=new Vector();	
String check="0"; //�ˬd���O
String dep_code="";
String center_code = "";
//�ˬd�O���O�ҰȲ�
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
//�ˬd�O���O�Ǩt
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
		<p>�z���s�������䴩JavaScript�y�k�A���O�ä��v�T�z��������������e</p>
	</noscript>
</head>
<body background="<%=vr%>images/ap_index_bg.jpg" alt="�I����" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- �w�q���s�_�l -->
<form name='EDIT1'>
	<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
		<tr class="mtbGreenBg">
			<td align=center>
				<div id="menu_btn">
					<input type=button name="C11_BTN" class="btn" value='�n���ۦP������s' onkeypress='doCout00("11");'onclick='doCout00("11");'>
					<input type=button name="C12_BTN" class="btn" value='�n�����׬�����s' onkeypress='doCout00("12");'onclick='doCout00("12");'>
					<input type=button name="C05_BTN" class="btn" value='�ҵ{�ޱ��ɶ�' onkeypress='doCout00("5");'onclick='doCout00("5");'>
					<input type=button name="C17_BTN" class="btn" value='�ҵ{²�����' onkeypress='doCout00("17");'onclick='doCout00("17");'>
					<input type=button name="C18_BTN" class="btn" value='�ҵ{�����ҵ{�a��' onkeypress='doCout00("18");'onclick='doCout00("18");'>
					<input type=button name="C03_BTN" class="btn" value='�n���е��p�զW��' onkeypress='doCout00("3");'onclick='doCout00("3");'>
					<input type=button name="C09_BTN" class="btn" value='���U�оǳ]�ƻݨD���' onkeypress='doCout00("9");'onclick='doCout00("9");'>
					<input type=button name="C109_BTN" class="btn" value='�C�L�ҵ{�}�]��ؽҵ{�j��' onkeypress='doCout00("109");'onclick='doCout00("109");' STYLE="display:none">
				</div>
			</td>
		</tr>
	</table>
</form>
<!-- �w�q���s���� -->
<!-- �w�q�s�誺 Form �_�l -->
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
		

	<!-- �s����e���_�l -->
	<TABLE id="EDIT_DIV" width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#FFFFFF">
				<!-- ���s�e���_�l -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
					<tr class="mtbGreenBg">
						<td align=left>�i�s��e���j- <span id='EditStatus'>�s�W</span><font color=purple size=3>�@�@���оǨt�P���ȥ��ˮ�<font color=red>���⡯</font><font color=purple>���O�_�T���J�A�H�קK��������L�k�C�L�����D�o�͡I�I</font></td>
						<td align=right>
							<div id="edit_btn">
								<input type=button class="btn" value='�^�d�߭�' onkeypress='doBack();'onclick='doBack();'>
								<input type=button name="ADD_BTN" class="btn" value='�s  �W' onkeypress='doAdd();'onclick='doAdd();'>
								<input type=button class="btn" value='�M  ��' onkeypress='doClear();'onclick='doClear();'>
								<input type=submit name="SAVE_BTN" class="btn" value='�s  ��'>
							</div>
						</td>
					</tr>
				</table>
				<!-- ���s�e������ -->

				<!-- �s��e���_�l -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
					<tr>
						<td align='right' class='tdgl1'>�Ǧ~��<font color=red>��</font>�G</td>
						<td class='tdGrayLight'>
							<input type=text name='AYEAR' onblur="chkCrsnoInCout001();">
							<select name='SMS' onchange="chkCrsnoInCout001();">
							<option value=''>�п��</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "SMS");</script>
							</select>
						</td>
						<td align='right' class='tdgl1'>��إN�X<font color=red>��</font>�G</td>
						<td class='tdGrayLight'>
							<input type='text' Column='CRSNO' name='CRSNO' onblur='Form.blurData("COU002M_01_BULR", "CRSNO,FACULTY_CODE", this.value+","+Form.getInput("EDIT","FACULTY_CODE"), ["CRS_NAME", "CRD"], [_i("EDIT", "CRS_NAME"), _i("EDIT", "CRD")], true);chkCrsnoInCout001();getCout002();'>
							<img id="img1" type="image" src='/images/select.gif' alt='�}�����' style='cursor:hand' onkeypress='Form.openPhraseWindow("COU002M_01_WINDOW", "FACULTY_CODE", Form.getInput("EDIT","FACULTY_CODE"), "��إN��, ��ئW��, �Ǥ���", [_i("EDIT", "CRSNO"), _i("EDIT", "CRS_NAME"), _i("EDIT", "CRD")]);chkCrsnoInCout001();getCout002();' onclick='Form.openPhraseWindow("COU002M_01_WINDOW", "FACULTY_CODE", Form.getInput("EDIT","FACULTY_CODE"), "��إN��, ��ئW��, �Ǥ���", [_i("EDIT", "CRSNO"), _i("EDIT", "CRS_NAME"), _i("EDIT", "CRD")]);chkCrsnoInCout001();getCout002();'>
							<input type=text Column='CRS_NAME' name='CRS_NAME' readonly>
						</td>
						<td align='right' class='tdgl1' >
							�������O<font color=red>��</font>�G<br>
							�h�����¶}�Z�G
						</td>	
						<td class='tdGrayLight'>
							<select name='CRS_TYPE' onchange="chkCrstype();">
								<option value=''>�п��</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "CRS_TYPE");</script>
							</select>
							<br>
							<select name='OPEN3' >
								<option value='N'>�_</option>
								<option value='Y'>�O</option>
							</select>
						</td>            			
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�Ǥ�<font color=red>��</font>�G</td>
						<td class='tdGrayLight'><input type='text' Column='CRD' name='CRD'></td>
						<td align='right' class='tdgl2'>�}�ҾǨt<font color=red>��</font>�G</td>
						<td class='tdGrayLight'>
							<select name='FACULTY_CODE' onclick = "setDynSelect();">
								<script>Form.getSelectFromPhrase("COU002M_02_SELECT", null, null);</script>
							</select>
						</td>
						<td align='right' class='tdgl2'>��s�׭q<font color=red>��</font>�G</td>
						<td class='tdGrayLight'>
							<select name='NEW_REWORK' >
								<option value=''>�п��</option>
								<script>Form.getSelectFromPhrase("COU002M_06_SELECT", "KIND", "NEW_REWORK");</script>
							</select>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�@�P�}�]�Ǩt�G</td>
						<td class='tdGrayLight'>
							<select name='COMMON_FACULTY_CODE'>
								<option value=''>�п��</option>
								<script>Form.getSelectFromPhrase("COU002M_04_SELECT", null, null);</script>
							</select>
						</td>
                        <td align='right' class='tdgl2'>�p���Ǩt<font color=red>��</font>�G</td>
						<td class='tdGrayLight'>
							<select name='PLAN_FACULTY_CODE'>
								<script>Form.getSelectFromPhrase("COU002M_02_SELECT", null, null);</script>
							</select>
						</td>
						<td align='right' class='tdgl2'  >�A�s���O�G<br>�¬��(�̫�}��)�N�X�G</td>
						<td class='tdGrayLight'>
							<select name='NEW_REWORK_KIND'>
								<option value=''>�п��</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "NEW_REWORK_KIND");</script>
							</select>
							<br>
							<input type='text' Column='BEFORE_CRSNO' name='BEFORE_CRSNO' onblur='Form.blurData("COU002M_07_BULR", "CRSNO", this.value, ["CRS_NAME"], [_i("EDIT", "BEFORE_CRS_NAME")], true);'>
							<img id="img2" type="image" src='/images/select.gif' alt='�}�����' style='cursor:hand' 
							onkeypress='Form.openPhraseWindow("COU002M_07_WINDOW", "BEFORE_CRSNO,BEFORE_CRS_NAME", _i("EDIT", "BEFORE_CRSNO").value+ "," +_i("EDIT", "BEFORE_CRS_NAME").value, "��إN��, ��ئW��", [_i("EDIT", "BEFORE_CRSNO"), _i("EDIT", "BEFORE_CRS_NAME")]);' 
							onclick='Form.openPhraseWindow("COU002M_07_WINDOW", "BEFORE_CRSNO,BEFORE_CRS_NAME", _i("EDIT", "BEFORE_CRSNO").value+ "," +_i("EDIT", "BEFORE_CRS_NAME").value, "��إN��, ��ئW��", [_i("EDIT", "BEFORE_CRSNO"), _i("EDIT", "BEFORE_CRS_NAME")]);'
							>
							<input type=text Column='BEFORE_CRS_NAME' name='BEFORE_CRS_NAME' readonly>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>���<font color=red>��</font>�G</td>
						<td class='tdGrayLight' >
						    <select name='FIELD_CODE'>
							     <option value=''>�п��</option>
						    </select>
						</td>	
						<td align='right' class='tdgl1'>�ҵ{���ש�<font color=red>��</font>�G</td>
						<td class='tdGrayLight'>
							<select name='CRS_CHAR'>
								<option value=''>�п��</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "CRS_CHAR");</script>
							</select>
						</td>
						<td align='right' class='tdgl1'>�}�Ҫ��A�G</td>
						<td class='tdGrayLight'>
							<select name='CRS_STATUS'>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "CRS_STATUS");</script>
							</select>
						</td>                        			
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�Ҹտ�Ҥ覡<font color=red>��</font>�G</td>
						<td class='tdGrayLight'  colspan='1'>			
							������
							<select name='EXAM_MK_MID' id='exam_mk_mid'>
								<option value=''>�п��</option>
								<option value='Y'>�Τ@�R�D�����Ҹ�(�E�c����)</option>
								<option value='M'>�Τ@�R�D�D�����Ҹ�(�E�c����)</option>
								<option value='N'>�D�Τ@�R�D�D�����Ҹ�(�h��ҵ{�����Z�L�Ǥ�)</option>
							</select><br>
							������
							<select name='EXAM_MK' id='exam_mk'>
								<option value=''>�п��</option>
								<option value='Y'>�Τ@�R�D�����Ҹ�(�E�c����)</option>
								<option value='M'>�Τ@�R�D�D�����Ҹ�(�E�c����)</option>
								<option value='N'>�D�Τ@�R�D�D�����Ҹ�(�h��ҵ{�����Z�L�Ǥ�)</option>
							</select>
						</td>
						<td align='right' class='tdgl2'>��إ���סG</td>
						<td class='tdGrayLight'>
							<select name='REQOPTION_TYPE'>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "REQOPTION");</script>
							</select>
						</td>
						<td align='right' class='tdgl2'>�w����ҤH�ơG</td>
						<td class='tdGrayLight'  colspan = "1"><input type=text name='EVAL_ST_NUM'></td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>���¦���<font color=red>��</font>�G</td>
						<td class='tdGrayLight'><input type=text name='TUT_TIMES'></td>					
						<td align='right' class='tdgl1'>��ߦ���(�t�q��)<font color=red>��</font>�G</td>
						<td class='tdGrayLight'><input type=text name='LAB_TIMES'></td>
						<td align='right' class='tdgl1'>��������<font color=red>��</font>�G</td>
						<td class='tdGrayLight'><input type=text name='CRS_TIMES'></td>						
					</tr>
					<tr>
                        <td align='right' class='tdgl2'>��Ѧr��(�׭q)�G</td>
						<td class='tdGrayLight'><input type=text name='ORI_TEXT_NUM'></td>					
                        <td align='right' class='tdgl2'>�w�p�׭q�r��(�׭q)�G</td>
						<td class='tdGrayLight'><input type=text name='MOD_TEXT_NUM'></td>						
						<td align='right' class='tdgl2'>�ϥιq���W�����ơG</td>
						<td class='tdGrayLight'><input type=text name='ON_PC_NUM'></td>						
					</tr>
					<tr>
						<td align='right' class='tdgl1'>����<font color=red>��</font>�G</td>
						<td class='tdGrayLight' >
							<select name='DISCIPLINE_CODE'>
								<option value=''>�п��</option>
							</select>						
						<td align='right' class='tdgl1'>�C�Ǥ��C�Ǵ����®ɼơG</td>
						<td class='tdGrayLight'><input type='text'  name='CRD_HR' ></td> 
						<td align='right' class='tdgl1'>�Ь�ѡG</td>
						<td class='tdGrayLight'>
							<select name='CRS_BOOK' id='crs_book1'>
                      			<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "CRS_BOOK");</script>
                  			</select>
              			</td>
					</tr>
			
					<tr>
						<td align='right' class='tdgl2'>�O�d�����G</td>
						<td class='tdGrayLight' colspan='3'><textarea name='RESERVE_ITEM' cols="70%" rows="2"></textarea></td>
						<td align='right' class='tdgl1'>�оǭ��¤覡<font color=red>��</font>�G</td>
						<td class='tdGrayLight' colspan='1'>
							<select name='TEACHING_TYPE'>
								<option value=''>�п��</option>
								<script>Form.getSelectFromPhrase("COU002M_09_SELECT", null, null);</script>
							</select>
						</td>					
					</tr>
					<tr>
						<td align='right' class='tdgl1'>�׭q�����G</td>
						<td class='tdGrayLight' colspan='3'><textarea name='REWORK_ITEM' cols="70%" rows="2"></textarea></td>
						<td align='right' class='tdgl1'>�оǭ��¤覡�W��<font color=red>��</font>�G</td>
						<td class='tdGrayLight' colspan='1'>
							<select name='TEACHING_TYPE_NAME'>
								<option value=''>�п��</value>
								<script>Form.getSelectFromPhrase("COU002M_10_SELECT", null, null);</script>
							</select>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�ϥδC�黡��<font color=red>��</font>�G</td>
						<td class='tdGrayLight' colspan='1'>
							<select name='PRODUCE_TYPE_CHOOSE'>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "PRODUCE_CHOOSE");</script>
							</select>
							<input type=button class="btn" name='BTN_PRODUCE1' id='BTN_PRODUCE1' value='�ޥ�' onkeypress='doPRODUCE_TYPE("1");' onclick='doPRODUCE_TYPE("1");'>
							<input type=button class="btn" name='BTN_PRODUCE2' id='BTN_PRODUCE2' value='����' onkeypress='doPRODUCE_TYPE("2");' onclick='doPRODUCE_TYPE("2");'>
							<input type=text name='PRODUCE_TYPE' readonly>
						</td>
						<td align='right' class='tdgl2'>�ϥΫD���մC�黡��<font color=red></font>�G</td>
						<td class='tdGrayLight' colspan='1'>
							<select name='OTHER_MEDIA_TYPE'>
								<option value=''>�п��</value>
								<script>Form.getSelectFromPhrase("COU002M_11_SELECT", null, null);</script>
							</select>
						</td>
                        <td align='right' class='tdgl1'><font color=red>��ƬO�_�ץX��<BR>�ҵ{�a�Ϻ����H</font></td>
						<td class='tdGrayLight' colspan='1'>
							<select name='MAP_EXPORT_MK'>
                          		<option value='Y'>�O</option>
                          		<option value='N'>�_</option>
                            </select>
						</td>	
					</tr>
					<tr>
						<td align='right' class='tdgl1'>�O�_���ޤ���<BR>�i��ҤH�ơH<font color=red>*</font></td>
						<td align='left' valign = 'middle' colspan='3'>
							<input type='radio' value='N' name='IS_CTROREG'  onclick='changeTextStatus(\"CLOSE\");' checked>�_�C
							<input type='radio' value='Y' name='IS_CTROREG' onclick='changeTextStatus(\"OPEN\");'>�O�A���ޱ��󻡩��G<br>
							<textarea rows='2' cols='80%' name='CTROREG_MK' ></textarea>&nbsp;
						</td>
						<td align='right' class='tdgl1'>��ҵe���ҵ{���ܻ���<BR>�̦h��30�r<font color=red></font></td>
						<td align='left' valign = 'middle' colspan='1'>
							�ȧe�{��i�h��ҵ{�ηL�Ǥ��ƽҵ{<br>
							<textarea rows='2' cols='40%' name='REG_MK' ></textarea>&nbsp;
						</td>
					</tr>	
					<tr>
						<td align='right' class='tdgl1'>�ҵ{��ƤޥΡG</td>		
						<td class='tdGrayLight' colspan='5'><input type=button class="btn"  value='�ҵ{��Ƥޥ�' onkeypress='doNEW_REWORK_1();' onclick='doNEW_REWORK_1();'>
						�U�C���i�����\����,�ޥΫe�@�̷s�}�ҾǦ~�����
						</td>		
					</tr>						
					<tr>
						<td align='right' class='tdgl1'>�׽ҳW�w�G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="FIRSTCOU" cols="70%"></textarea>
						</td>
					</tr>					
					<tr>
						<td align='right' class='tdgl1'>�Юv�ǳN���G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="TCH_ACADFIELD" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�Ǭ�e���ǳN���G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="PRO_ACADFIELD" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>���ҵ{�P�Ǩt�ؼ����p�ʡG</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="DISCIPLINE_TARGET" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>���դw�}�������ҵ{�����G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="OPENED_DESCRIPTION" cols="70%"></textarea>
						</td>
					</tr>
					<tr style= 'display:none'>
						<td align='right' class='tdgl1'>��L�G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="OTHER" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�����¦���ѡG</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="BASIC_KNWLDG" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>�ҵ{���n(�p�e)�G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="CRS_GUTLINE" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�ҵ{���n(²��)�G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="CRS_OUTLINE" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>�ҵ{�ؼ�(�p�e)�G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="TUT_TARGET" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�ҵ{�ؼ�(²��)�G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="TUT_TARGET_INTRODUCTION" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl1'>�нҮѳ��`�G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="CRS_BOOK_CHAPTER" cols="70%"></textarea>
						</td>
					</tr>
					<tr>
						<td align='right' class='tdgl2'>�ҵ{�j���Ƶ��G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="RMK" cols="70%"></textarea>
						</td>
					</tr> 
					<tr>
						<td align='right' class='tdgl1'>�Ƶ�(�׭q)�G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="MOD_RMK" cols="70%"></textarea>
						</td>
					</tr> 
					<tr>
						<td align='right' class='tdgl2'>�ѦҮѥءG</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="BIBLIOGRAPHY" cols="70%"></textarea>
						</td>
					</tr> 
					<tr>
						<td align='right' class='tdgl1'>���q�覡�G</td>
						<td class='tdGrayLight' colspan='5'>
							<textarea rows="5" name="EVAL_MANNER" cols="70%"></textarea>
						</td>
					</tr> 
				</table>
				<!-- �s��e������ -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="�ƪ��ιϥ�" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
		</tr>
	</table>
	<!-- �s����e������ -->
</form>
<!-- �w�q�s�誺 Form ���� -->

<!-- ���D�e���_�l -->
<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0" summary="�ƪ��Ϊ��">
	<tr>
		<td>
			<table width="500" height="27" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td background="<%=vr%>images/ap_index_title.jpg" alt="�ƪ��ιϥ�">
						�@�@<span class="title">COU002M_���@�Ǵ��}�ҭp�e</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- ���D�e������ -->

<!-- �w�q�s�誺 Form �_�l -->
<form name="VIEW" method="post" style="margin:5,0,0,0;">
	<input type=hidden name="control_type">
	<input type=hidden name='AYEAR'>
	<input type=hidden name='SMS'>
	<input type=hidden name='CRSNO'>

	<!-- �s����e���_�l -->
	<TABLE width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#FFFFFF">
				<!-- ���s�e���_�l -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
					<tr class="mtbGreenBg">
						<td align=left>�}�Ҭ�����T�Ѧ�</td>
						<td align=right>
						</td>
					</tr>
				</table>
				<!-- ���s�e������ -->

				<!-- �s��e���_�l -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
					<tr>
						<td align='center' class='tdgl1' width='20%' rowspan=2>
							���~�}�Ҫ��p<br>
							<input type=button name="HISTORY_COU_BTN" class="btn" value='���o���~�}�Ҫ��p' onkeypress='doHistory();'onclick='doHistory();'>
						</td>
						<td align='right' class='tdgl1' width='10%'>�Ǧ~��</td>
						<td id='ayearsms0' class='tdGrayLight' width='17%'>&nbsp;</td>
						<td id='ayearsms1' class='tdGrayLight' width='17%'>&nbsp;</td>
						<td id='ayearsms2' class='tdGrayLight' width='17%'>&nbsp;</td>
						<td id='ayearsms3' class='tdGrayLight' width='17%'>&nbsp;</td>
					</tr>	
					<tr>					
						<td align='right' class='tdgl1'>��ҤH��</td>
						<td id='stu_num0' class='tdGrayLight'>&nbsp;</td>
						<td id='stu_num1' class='tdGrayLight'>&nbsp;</td>
						<td id='stu_num2' class='tdGrayLight'>&nbsp;</td>
						<td id='stu_num3' class='tdGrayLight'>&nbsp;</td>
					</tr>					
					<tr>					
						<td align='right' class='tdgl2'>���׬�ءG</td>
						<td id='info1' class='tdGrayLight' colspan=5>&nbsp;</td>
					</tr>
					<tr>					
						<td align='right' class='tdgl1'>�ۦP��ءG</td>
						<td id='info2' class='tdGrayLight' colspan=5>&nbsp;</td>
					</tr>
					<tr>					
						<td align='right' class='tdgl2'>�ҵ{�j��(�½ҵ{)�G</td>
						<td id='info3' class='tdGrayLight' colspan=5>&nbsp;</td>
					</tr>
					<tr>					
						<td align='right' class='tdgl1'>�е��p�զW��G</td>
						<td id='info4' class='tdGrayLight' colspan=5>&nbsp;</td>
					</tr>					
				</table>
				<!-- �s��e������ -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="�ƪ��ιϥ�" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
		</tr>
	</table>
	<!-- �s����e������ -->
</form>
<!-- �w�q�s�誺 Form ���� -->

<!-- �w�q�s�誺 Form �_�l -->
<form name="VIEW2" method="post" style="margin:5,0,0,0;">
	<input type=hidden name="control_type">
	<!--�D�n�Ѽ�-->
	<input type=hidden name='AYEAR'>
	<input type=hidden name='SMS'>
	<input type=hidden name='CRSNO'>
	<!--���n�Ѽ�-->	
	<input type=hidden name='FACULTY_CODE'>
	<input type=hidden name='CRS_NAME'>
	<input type=hidden name='CRD'>
	<input type=hidden name='REQOPTION_TYPE'>
	<input type=hidden name='NEW_REWORK'>
	<input type=hidden name='PRODUCE_TYPE'>
	<input type=hidden name='CRS_TIMES'>

	<!-- �s����e���_�l -->
	<TABLE id='imsuperman' width="96%" border="0" align="center" cellpadding="0" cellspacing="0" summary="�ƪ��Ϊ��">
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_01.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_02.gif" alt="�ƪ��ιϥ�" width="100%" height="14"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_03.gif" alt="�ƪ��ιϥ�" width="13" height="14"></td>
		</tr>
		<tr>
			<td width="13" background="<%=vr%>images/ap_index_mtb_04.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
			<td width="100%" valign="top" bgcolor="#FFFFFF">
				<!-- ���s�e���_�l -->
				<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
					<tr class="mtbGreenBg">
						<td align=left>���}/���}�@�~</td>
						<td align=right>
						</td>
					</tr>
				</table>
				<!-- ���s�e������ -->

				<!-- �s��e���_�l -->
				<table id="table2" width="100%" border="0" align="center" cellpadding="2" cellspacing="0" summary="�ƪ��Ϊ��">
					<tr>
						<td align='right' class='tdgl1' width='20%'>���}�G</td>
						<td class='tdGrayLight'>
							<input type=button name="STOP_BTN" class="btn" value='��  �}' onkeypress='doStop();'onclick='doStop();'>
							<font color=red size='1px'>���@�~�����A�N�|����Ӭ�ت��Ҧ��@�~�A�p���٭�A�ݳz�L�ҰȲզ�F�H���A�ФT����!</font>
						</td>
					</tr>	
					<tr>
						<td align='right' class='tdgl2' width='20%'>���}�G</td>
						<td class='tdGrayLight'>
							<input type=text name='D_AYEAR'>
							<select name='D_SMS'>
								<option value=''>�п��</option>
								<script>Form.getSelectFromPhrase("COU002M_01_SELECT", "KIND", "SMS");</script>
							</select>						
							<input type=button name="DELAY_BTN" class="btn" value='��  �}' onkeypress='doDelay();'onclick='doDelay();'>
						</td>
					</tr>					
				</table>
				<!-- �s��e������ -->
			</td>
			<td width="13" background="<%=vr%>images/ap_index_mtb_06.gif" alt="�ƪ��ιϥ�">&nbsp;</td>
		</tr>
		<tr>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_07.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
			<td width="100%"><img src="<%=vr%>images/ap_index_mtb_08.gif" alt="�ƪ��ιϥ�" width="100%" height="15"></td>
			<td width="13"><img src="<%=vr%>images/ap_index_mtb_09.gif" alt="�ƪ��ιϥ�" width="13" height="15"></td>
		</tr>
	</table>
	<!-- �s����e������ -->
</form>
<!-- �w�q�s�誺 Form ���� -->

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
