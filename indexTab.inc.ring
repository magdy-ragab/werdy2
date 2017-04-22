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