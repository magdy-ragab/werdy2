Load "guilib.ring"

new qApp {

        win1 = new qWidget()
        {
                setWindowTitle("Test using Event Filter!")
                setGeometry(100,100,400,400)
               
                /*myfilter = new qallevents(win1)
                myfilter.setKeyPressEvent("pWork()")
                myfilter.setMouseButtonPressevent("pClick()")
                myfilter.setmousemoveevent("pMove()")*/
                
				
				
				txt= new QTextEdit(win1)
				{
					setText("Text")
					setReadOnly(true)
					setdisabled(true)
					setmousetracking(true)
					myfilter2 = new qallevents(txt)
					myfilter2.setMouseButtonPressevent("pClick()")
					installeventfilter(myfilter2)
				}
				installeventfilter(myfilter2)
                show()
        }

        exec()
}

func pWork
        win1.setwindowtitle('KeyPress! : ' + myfilter2.getkeycode())

func pClick
        new qmessagebox(win1) {
                setgeometry(100,100,400,100)
                setwindowtitle("click event!")
                settext("x : " + myfilter2.getx() +
                        " y : " + myfilter2.gety() + " button : " +
                         myfilter2.getbutton() )
                show()
        }

func pMove
        win1.setwindowtitle("Mouse Move , X : " + myfilter2.getx() +
                            " Y : " + myfilter2.gety() )