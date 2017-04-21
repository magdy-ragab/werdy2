_title= "وردي"
_version= "2.00"
_i=0
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
		setStyleSheet("background-color:#222222;color:#ffffff;padding:0; margin:0")
		//#757053
		suraTab = new qwidget()
		{
			//setStyleSheet("background:transparent;")
			//setWindowFlags(Qt_CustomizeWindowHint | Qt_WindowTitleHint | Qt_WindowStaysOnTopHint)
			setStyleSheet(scollBarsStyle())
			setContentsMargins(0,0,0,0)
			
			qtext= new QTextEdit(suraTab) 
			{
			
				oFont = new qfont("",0,0,0)
				oFont.setRawName("UthmanicHafs.ttf")
				oFont.setPixelSize(20)
				setfont(oFont)
				setReadOnly(true)
				setText(getPage(11)+getPage(12)+getPage(13))
				setStyleSheet("background-image:url('img/islamic-star.png');background-color:#FFFFFF;color:#2b2817;")
				
			}
			
			
			
			layout2 = new qHBoxLayout() {
				addwidget(qtext)
			}
			
			suraTab.setLayout(layout2)
		}
		
		indexTab= new qwidget(){
			table1 = new qTableWidget(indexTab) {
				horizontalHeader().hide();
				//verticalHeader().hide();
				horizontalHeader().setStretchLastSection(true);
				setrowcount(114)
				setcolumncount(1)
				setStyleSheet(scollBarsStyle())
				for suraIndexLoop=1 to 114
					v=(suraIndexLoop-1)
					suraDataTable=suraIndex(suraIndexLoop)
					if suraIndexLoop%2 bg='#fafff2' else bg='#f5f9e8'  ok
					eval('suraTextEditIndex_txt_'+suraIndexLoop+' = new QTextEdit(indexTab){
						sethtml("'+suraDataTable+'")
						setReadOnly(true)
						setdisabled(true)
						setstylesheet("border:0px none; background-color: '+bg+';color:#000")
						myfilter'+suraIndexLoop+' = new qallevents(suraTextEditIndex_txt_'+suraIndexLoop+')
						myfilter'+suraIndexLoop+'.setMouseButtonDblClickEvent("goToPage('+suraIndexLoop+')")
						installeventfilter(myfilter'+suraIndexLoop+')
					}
					setCellWidget('+v+',0, suraTextEditIndex_txt_'+suraIndexLoop+')')
				next
				setcellDoubleClickedEvent("seeTime()")
				/*horizontalHeader().setStyleSheet("color: blue; font-weight:bold;height:300px")*/
				verticalHeader().setDefaultSectionSize(50);
			}
			layout3= new qHBoxLayout() {
				addwidget(table1)
			}
			
			indexTab.setLayout(layout3)
		}
		
		bookMarksTab= new qwidget(){
			new qlabel(bookMarksTab){settext("1")}
		}
		
		settingsTab= new qwidget(){
			new qlabel(bookMarksTab){settext("2")}
		}
		
		helpTab= new qwidget(){
			new qlabel(bookMarksTab){settext("3")}
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