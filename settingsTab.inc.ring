setStyleSheet(scollBarsStyle()+"")
setFixedHeight(370)
setStyleSheet("color:#000000;height:25px")


PagesPerTime = new qLabel(settingsTab) {
	settext("عدد الصفحات في المرة : ")
	setStyleSheet("border:0px none;;")
}

reade = new qLabel(settingsTab) {
	settext("عدد الدقائق بين كل ورد:")
	setStyleSheet("border:0px none;;")
}

spinnr = new qspinbox(settingsTab) {
	pagesRead=pagesCount()
	pagesRead=1*pagesRead
	setvalue(pagesRead)
	setrange(1, 100)
	setStyleSheet(";")
}

spinner2 = new qspinbox(settingsTab) {
	werdHour=werdyTimers()
	werdHour=1*werdHour
	setvalue(werdHour)
	setrange(1, 500)
	setSingleStep(15)
	setStyleSheet(";")
}

readTimeLabel1 = new qLabel(settingsTab) {
	settext("تشغيل بين الساعة")
	setStyleSheet("border:0px none;;")
}



readTimeCombo1= New qspinbox(settingsTab) 
{
	getStartTimeV=getStartTime()
	getStartTimeV=1*getStartTimeV
	setvalue(getStartTimeV)
	setrange(0, 23)
	setStyleSheet(";")
}

readTimeLabel2 = new qLabel(settingsTab) {
	settext("و الساعة")
	setStyleSheet("border:0px none;;")
}

readTimeCombo2= New qspinbox(settingsTab) 
{
	getEndTimeV=getEndTime()
	getEndTimeV=1*getEndTimeV
	setvalue(getEndTimeV)
	setrange(1, 23)
	setStyleSheet(";")
}


clean_label= new qcheckbox(settingsTab) {
	settext("لاتعرض التشكيل")
	setStyleSheet("border:0px none;;")
	if clean_only='1'
		setChecked(true)
	ok
}

setdefaultBtn  = new qPushButton(settingsTab) {
	settext("الإعدادات الإفتراضية")
	setStyleSheet("qproperty-icon: url('images/1466523816_Info.png'); color:red; font-weight:bold;;")
	setclickevent("setdefault()")
}



WerdContReadBtn  = new qPushButton(settingsTab) {
	settext("إعادة تشغيل الورد")
	setStyleSheet("qproperty-icon: url('images/1464846947_book.png');;")
	setclickevent("WerdContRead()")
}


settingsSubmit= new qPushButton(settingsTab) {
	settext("حفظ")
	setclickevent("settingsSubmitClicked()")
	setStyleSheet(";")
}




layout200 = new qHBoxLayout() {
	addwidget(spinnr)
	addwidget(PagesPerTime)
}

layout201 = new qHBoxLayout() {
	addwidget(spinner2)
	addwidget(reade)
}

layout204 = new qHBoxLayout() {
	addwidget(WerdContReadBtn)
}

layout205 = new qHBoxLayout() {
	addWidget(clean_label)
}

layout206 = new qHBoxLayout() {
	addWidget(clean_label)
}

layout207 = new qHBoxLayout() {
	addWidget(settingsSubmit)
}



layoutreadTimeSettings = new qHBoxLayout() {
	addWidget(readTimeCombo2)
	addWidget(readTimeLabel2)
	addWidget(readTimeCombo1)
	addWidget(readTimeLabel1)
}

/*appTypeLayout= new qHboxLayout(settingsTab)
{
	addWidget(appTypeCombo)
	addWidget(appTypeLabel)
}*/

layout203 = new qVBoxLayout() {
	addLayout(layout200)
	addLayout(layout201)
	//addLayout(appTypeLayout)
	addLayout(layoutreadTimeSettings)
	addWidget(setdefaultBtn)
	addLayout(layout205)
	addLayout(layout206)
	addLayout(layout204)
	addLayout(layout207)
}

setLayout(layout203)