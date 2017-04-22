setStyleSheet(scollBarsStyle())
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