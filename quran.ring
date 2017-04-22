_title= "وردي"
_version= "2.00"
_i=0
pagescount=3
clean_only=0
aya_block=1
load "guilib.ring"
load "func.ring"
/*
#222222
#746F52
#2b2817
#4F4C3B
#8D9183
#FDFFFA
#DADECD
#BCA562
*/



app1 = new qapp{
	win1= new qwidget()
	{
		setContentsMargins(-15,-15,-15,-15)
		setwindowtitle(_title+ " : الاصدار "+ _version)
		setFixedWidth(400)
		setFixedHeight(650)
		setStyleSheet("background-color:#FFFFFF;color:#222;background-image:url('img/islamic-star.png');")
		//#757053
		suraTab = new qwidget()
		{
			load 'suraTab.inc.ring'
		}
		
		indexTab= new qwidget(){
			load 'indexTab.inc.ring'
		}
		
		bookMarksTab= new qwidget(){
			load 'bookmarksTab.inc.ring'
		}
		
		settingsTab= new qwidget(){
			load 'settingsTab.inc.ring'
		}
		
		helpTab= new qwidget(){
			load 'helpTab.inc.ring'
		}
		

		tab1 = new qtabwidget(win1)
		{
			inserttab(0,suraTab      , "  "+  _title +" ")
			inserttab(1,indexTab     , "  الفهرس ")
			inserttab(2,bookMarksTab , "  الاشارات ")
			inserttab(3,settingsTab  , "  الاعدادات ")
			inserttab(4,helpTab      , "  مساعدة ")
			setStyleSheet("
				QTabWidget::pane { /* The tab widget frame */
				border-top: 1px solid #ffffff;
				}
				QTabWidget::tab-bar {
				}
				/* Style the tab using the tab sub-control. Note that it reads QTabBar _not_ QTabWidget */
				QTabBar::tab {
				background: #8D9183;
				border-width: 0;
				border-style: none;
				color:#ffffff;
				min-width: 61px;
				padding: 5px 10px;
				}
				QTabBar::tab:selected, QTabBar::tab:hover {
				background: #dadecd;
				color: #000000;
				border-top:2px solid #000;
				}
				QTabBar::tab:selected {
				border-color: #9B9B9B;
				border-bottom-color: #C2C7CB; /* same as pane color */
				color: #000000;
				}
				QTabBar::tab:!selected {
				margin-top: 2px; /* make non-selected tabs look smaller */
				}")
		}
		
		layout101= new qVBoxLayout() {
			addwidget(tab1)
			
		}
		setLayout(layout101)
		
		
		for suraIndexLoop=1 to 114
			eval('installeventfilter(myfilter'+suraIndexLoop+')')
		next
		show()
	}
exec()
}
func table _text,pageID, joz, hezb,suraName
	_i++
	if( _i%2 ) bg_right="3-shadow" bg_left="4" align='right' else bg_right="3"  bg_left="4-shadow" align='left' ok
	return '<table border=0 width=100% cennpadding=0 cellspacing=0>
			'+topTd(joz,hezb,suraName)+'<tr>'+sideTd(bg_right)+'<td style="padding:5px">'+_text+'</td>'+sideTd2(bg_left)+
			'</tr>'+bottomTd()+'</table><table border=0 width=100% style="margin-bottom:10px;"><tr><td align="center" style="color:#746F52;font-family: Tahoma; font-size:9px; font-weight:bold;">('+ pageID +')</td></tr></table>'
func sideTd bg
	return '<td width=28 style="background-image:url(img/'+bg+'.png);background-position: center;"></td>';
	
func sideTd2 bg
	return '<td width=28 style="background-image:url(img/'+bg+'.png);background-position: center;"></td>';
	
func topTd joz,hezb,suraName
	return '<tr><td colspan=3 style="color:#8D9183;font-family: Tahoma; font-size:9px; font-weight:bold;">
		<table width=100%>
			<tr>
				<td align=left> جزء : '+joz+', حزب : '+hezb +' </td>
				<td> سورة : '+suraName+' </td>
			</tr>
		</table>
	</td></tr><tr><td colspan=3><div style="height:5px;background-color:#3c5440;margin:5px 0; font-size:1px;font-family:Tahoma;"> </div></td></tr>';

func bottomTd
	return '<tr><td colspan=3><div style="height:5px;background-color:#3c5440;margin:5px 0; font-size:1px;font-family:Tahoma;"> </div></td></tr>';
func css
	return "font-size:12px;line-height:50px;";





func getPage pageID
	p="<p align=justify>"
	query.exec("select * from `Quran` where `page`='"+ pageID +"'")
	while query.movenext()
		theid= query.value(0).tostring()
		aya_no= query.value(2).tostring()
		suraid = query.value(1).tostring()
		joz= query.value(4).tostring()
		page= query.value(3).tostring()
		suraName= query.value(7).tostring()
		aya= query.value(6).tostring()
		hezb= query.value(5).tostring()
		sura  =suraName
		p+= aya+' <font face="Traditional Arabic">&#64831;'+aya_no+'&#64830;</font> '
	end
	p+="</p>"
	return table(p,pageID,joz, hezb, suraName)
	
func suraIndex suraID
	query.exec("select * from Sura where `ID`='"+ suraID +"'")
	query.movenext()
	suraData  ="<table border=0 dir=rtl width=100% cellpadding=0 cellspacing=0>
		<tr>
			<td width=20 align=center> </td>
			<td rowspan=2><h2 style='color:#4F4C3B'>"+ query.value(1).tostring() +"</h2></td>
			<td rowspan=2 width=20 align=center>"+suraID+"</td>
		<tr>
			<td align=center> </td>
		</tr>
		<tr>
			<td colspan=3>
				<table width=100% cellpadding=0 cellspacing=0>
					<tr>
						<td> الآيات : "+  query.value(2).tostring() +" </td>
						<td>صفحة : "+  query.value(3).tostring() +"</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>"
	return suraData
	
func seeTime
	see time()+nl

func goToPage pageID
	see pageID+ nl
	
func scollBarsStyle
	return "QScrollBar:vertical {   "+            
	"    border: 1px solid #999999;"+
	"    background:white;"+
	"    width:25px;    "+
	"    margin: 0px 0px 0px 0px;"+
	"}"+
	"QScrollBar::handle:vertical {"+
	"    background: qlineargradient(x1:0, y1:0, x2:0, y2:1,"+
	"    stop: 0 #DADECD, stop:1 #C4C9B3);"+
	"    min-height: 1px;"+
	""+
	"}"+
	"QScrollBar::add-line:vertical {"+
	"    background: qlineargradient(x1:0, y1:0, x2:1, y2:0,"+
	"    stop: 0  rgb(32, 47, 130), stop: 0.5 rgb(32, 47, 130),  stop:1 rgb(32, 47, 130));"+
	"    height: 0px;"+
	"    subcontrol-position: bottom;"+
	"    subcontrol-origin: margin;"+
	"}"+
	"QScrollBar::sub-line:vertical {"+
	"    background: qlineargradient(x1:0, y1:0, x2:1, y2:0,"+
	"    stop: 0  rgb(32, 47, 130), stop: 0.5 rgb(32, 47, 130),  stop:1 rgb(32, 47, 130));"+
	"    height: 0px;"+
	"    subcontrol-position: top;"+
	"    subcontrol-origin: margin;"+
	"}"
	
	

func pagesCount
	query.exec("select * from user_data")
	query.movenext()
	pagesRead  =query.value(1).tostring()
	return 1*pagesRead

	
func werdyTimers
	query.exec("select * from user_data")
	query.movenext()
	werdHour  =query.value(2).tostring()
	return 1*werdHour


func getStartTime
	query.exec("select * from user_data")
	query.movenext()
	r  =query.value(9).tostring()
	return r

func getEndTime
	query.exec("select * from user_data")
	query.movenext()
	r  =query.value(10).tostring()
	return r


	
func WerdContRead
	q="update `user_data` set `snoozeTo`= '2000-12-31 00:00:00'"
	query.exec( q)

func settingsSubmitClicked
	setNewPages   = spinnr.value()
	setNewMinutes = spinner2.value()
	clean_only = clean_label.ischecked()
	aya_block = aya_block_check.ischecked()
	//apptype= appTypeCombo.currentText()
	
	timeStart=readTimeCombo1.value()
	timeEnd=readTimeCombo2.value()
	
	if(1*timeStart)>=(1*timeEnd)
		dialogBoxOk("عفواً ساعة الإنتهاء يجب أن تكون أقل من ساعة البداية",win1)
	else
		if len( string(timeStart))= 1
			timeStart="0"+timeStart
		ok
		
		if len( string(timeEnd))= 1
			timeEnd="0"+timeEnd
		ok
		
		query.exec("update `user_data` set `pages`='"+setNewPages+"', `minutes`='"+ setNewMinutes +"', `clean`='"+ clean_only +"', `aya_block`='"+aya_block+"', `timeEnd`='"+timeStart+"' , `timeStart`='"+timeEnd+"'")
		tab1.setCurrentIndex(0)
	ok
	see "<<RELOAD HERE>>>>"