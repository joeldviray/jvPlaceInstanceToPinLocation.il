procedure( jvPlaceInstanceToPinLocation()

	cv=geGetEditCellView()
	selected=geGetSelSet()
	geDeselectAll()

	foreach(cell selected
		;;if(cell~>cellName=="edgebuf_unit" then
			;cellOrigin=cell~>xy
			;cellNet=car(cell~>conns~>net~>name)
			cellNet=nth(3 cell~>conns~>net~>name)

			foreach(pin cv~>shapes
				
					if(pin~>purpose=="pin"&&pin~>net~>name==cellNet then
					pinOrigin=car(pin~>bBox)
					geSelectFig(pin)
					);if
				
			)	
			cell~>xy=pinOrigin		

		;;);if

	);foreach
	geDeselectAll()
	geSelectFigs(selected)
)

procedure( jvAbout2() ;jvSelectInstanceByPin()

	cv=geGetEditCellView()

	foreach(cell cv~>instances
		cellNet=cell~>conns~>net~>name
		cellX=caar(cell~>xy)
		cellY=
		
		if(rexMatchList(car(geGetSelSet()~>net~>name) cellNet) then
			geSelectFig(cell)
			;printf("test")
			
		)
		
	);foreach

);procedure

procedure( jvSelectInstanceByPin() ;ver2 for selecting pin and selects the instance correspondence - its working

	;jvListNets()


	foreach(pin geGetSelSet()
		foreach(cell geGetEditCellView()~>instances
			cellNet=cell~>conns~>net~>name
			if(rexMatchList(pin~>net~>name cellNet) then
			geSelectFig(cell)
			;cell~>conns~>net~>name	
			);if
		);foreach
	);foreach

	jvListNets()


);procedure

procedure( jvAbout4() ;jvFlipHorizontal()

	;Need to load these first..
	;load("/home/jviray/.skill_jv/jvTool/abFlip.il")
	;load("/home/jviray/.skill_jv/jvTool/abZoomSel.il")

	;foreach(inst geGetSelSet()
		abFlip()
		;printf("test")
	;);foreach	

);

hiSetBindKey("Layout" "Ctrl<key>q" "jvAbout4()")

procedure( jvFlipHorizontal() ;ver2 - its working

	;Need to load these first..
	;load("/home/jviray/.skill_jv/jvTool/abFlip.il")
	;load("/home/jviray/.skill_jv/jvTool/abZoomSel.il")


	selected=geGetSelSet()
	geDeselectAll()

	foreach(selected1 selected
		geSelectFig(selected1)
		abFlip()
		geDeselectFig(selected1)
	);foreach

)

procedure( jvListNets()

	printf("%L" geGetSelSet()~>conns~>net~>name)


)
