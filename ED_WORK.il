;;  load("~/Skill/ED_WORK.il")

let( (library cell pcellId)
library="PAD_cell"
;; replace all library sinon PB maj (name library unknown ...)
cell = "PAD_inter0"

pcDefinePCell(
list(ddGetObj("PAD_cell") cell "layout")
( (width float 1.0) (height float 1.0) (P2M4Cont boolean "TRUE") (cap boolean "TRUE")  )
let( ( rect rectBorder rectBoundary pcInst rwidth )
(setq rwidth width-1.0) ; relative width


;; list("PO2CUT" "drawing") layerNum : 91  ?? where is ?? : dans cpoly.Ed
;; ** definition des differents elements : rect, path etc...  **
(pcInst  = rodCreateRect	(?cvId pcCellView ?layer 35	?bBox list((-5.0:255.7) ((35.0 + width):258.6))))
(pcInst = rodCreateRect(?cvId pcCellView ?layer 35	?bBox list((-5.0:177.95) ((35.0 + width):180.85))))
(pcInst = rodCreateRect(?cvId pcCellView ?layer 42	?bBox list((0.0:106.25) ((30.0 + width):141.2))))
(pcInst = rodCreateRect(?cvId pcCellView ?layer 42	?bBox list((0.0:183.85) ((30.0 + width):218.8))))
(pcInst = rodCreateRect(?cvId pcCellView ?layer 42	?bBox list((0.0:221.8) ((30.0 + width):256.75))))
(pcInst = rodCreateRect(?cvId pcCellView ?layer 39	?bBox list((0.0:105.35) ((30.0 + width):129.25))))
(pcInst = rodCreateRect(?cvId pcCellView ?layer 39	?bBox list((0.0:132.25) ((30.0 + width):153.15))))

;	(pcInst = rodCreateRect(?cvId pcCellView ?layer 42
;		?bBox list((0.0:144.2) ((30.0 + width):179.15))))
	(pcInst = rodCreatePath(?cvId pcCellView ?layer 42
		?pts list((0.0:161.675) (30.0+width:161.675))
		?width 34.95
		?justification	 "center"  ;;"truncateExtend"
		?subRect	 list(
		list(
			?layer	 list("MET4" "drawing")
			?width	 3.000000
			?length	 10.000000
			?choppable	 t
                        ?beginOffset   -30.00000
                        ?endOffset     -30.00000
			?sep	 0.000000
			?justification	 "right"
			?space	 30.000000
			?gap	 "distribute"
			?diagonal	 t
			)
		)
	))

	(pcInst = rodCreatePath(?cvId pcCellView ?layer 42
		?pts list((0.0:239.275) (30.0+width:239.275)) 
		?width 34.95 
		?justification	 "center"  ;;"truncateExtend"
		?subRect	 list(
		list(
			?layer	 list("MET4" "drawing")
			?width	 3.000000
			?length	 10.000000
			?choppable	 t
                        ?beginOffset   -30.00000
                        ?endOffset     -30.00000
			?sep	 0.000000
			?justification	 "right"
			?space	 30.000000
			?gap	 "distribute"
			?diagonal	 t
			)
		)
	    ))


	(pcInst = rodCreateRect(?cvId pcCellView ?layer 39
		?bBox list((0.0:156.15) ((30.0 + width):180.05))))

	(pcInst = rodCreatePath(?cvId pcCellView ?layer 39
		?pts list((0.0:142.7)(30.0 + width:142.7))
		?width 20.9 
		?subRect	 list(
		list(
			?layer	 list("MET3" "drawing")
			?width	 3.000000
			?length	 10.000000
			?choppable	 t
                        ?beginOffset   -30.00000
                        ?endOffset     -30.00000
			?sep	 0.000000
			?justification	 "right"
			?space	 30.000000
			?gap	 "distribute"
			?diagonal	 t
			)
		list(
			?layer	 list("MET3" "drawing")
			?width	 3.000000
			?length	 10.000000
			?choppable	 t
                        ?beginOffset   -30.00000
                        ?endOffset     -30.00000
			?sep	 0.000000
			?justification	 "left"
			?space	 30.000000
			?gap	 "distribute"
			?diagonal	 t
			)
		)
	    ))



;; insertion conditionnel de la capa
	when( cap
	when( (width > -20)
	(pcMaster = dbOpenCellViewByType("PAD_cell" "cpoly.Ed" "layout" "maskLayout"))
	(pcInst = dbCreateParamInst(pcCellView pcMaster nil 
		(22.6 - 0.5   + width/2:122.675) "R90"
;;		(22.625   + (width+10) /2:122.675) "R90"
		1 
;;		list(list("width" "float" (width - 10 )/2  ) ;)
;;		list(list("width" "float" width /2 +14.2 - 1 ) ;)
;;		list(list("width" "float" width + (14.2 - 0.4 ) - 0.6 );)
		list(list("width" "float" width + (14.2 - 1 ) )
		    list("height" "float"  254.85 )
		    list("BottomP2Cont" "boolean" "FALSE") 
		    list("topP2Cont" "boolean" "FALSE") 
		    list("RightP2Cont" "boolean" "FALSE")
	)))


;; ***pins creation

(pcNetName = "i") 
pcTermNet = dbCreateNet(pcCellView pcNetName)
(pcTerm = dbCreateTerm(pcTermNet pcNetName "inputOutput" ))
(pcInst = dbCreateRect(pcCellView list(70 "metal1")
		list((15.8:254.025)(16.3:254.525))))
(pcPin = dbCreatePin(pcTermNet pcInst pcNetName)) 
setSGq(pcPin '("top" "bottom" "left" "right") accessDir)


(pcNetName = "o") 
pcTermNet = dbCreateNet(pcCellView pcNetName)
(pcTerm = dbCreateTerm(pcTermNet pcNetName "inputOutput" ))
(pcInst = dbCreateRect(pcCellView list(70 "metal1")
		list((15.8:0.225)(16.3:0.725))))
(pcPin = dbCreatePin(pcTermNet pcInst pcNetName))


;; ***pins label
(pcLabelHeight = 1) 
(pcLabelText = "i") 
(pcInst = dbCreateLabel(pcCellView 
		list(70 "metal1") (16.325:254.25) pcLabelText "centerCenter"
		"R270" "stick" pcLabelHeight ))
(pcLabelText = "o") 
(pcInst = dbCreateLabel(pcCellView 
		list(70 "metal1") (16.325:0.45) pcLabelText "centerCenter"
		"R270" "stick" pcLabelHeight ))


;; contacts de P2 � M4
when( P2M4Cont 
when( width>= 13.2 width = 13.2); <= DRC METx max width

;; premier P2M4Cont
	rodCreateRect(?cvId pcCellView ?layer list("MET2" "drawing")
		?bBox list((4.75:221.8)(25.25 + width:254.9)))
	rodCreateRect(?cvId pcCellView ?layer list("MET3" "drawing")
		?bBox list((4.75:221.8)(25.25 + width:254.9)))

;; MET1 + tous les VIAS et CONT
	rodCreateRect(?cvId pcCellView ?layer 35
		?bBox list((4.75:221.8)(25.25 + width:254.9))
?subRectArray list(
	list( ?layer list("CONT" "drawing") ?width 0.4 ?length 0.4
?lowerLeftOffsetX   0.4 ?upperRightOffsetX -0.4  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.4 ?upperRightOffsetY -0.4	)
	list( ?layer list("VIA1" "drawing") ?width 0.5 ?length 0.5
?lowerLeftOffsetX   0.4 ?upperRightOffsetX -0.4  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.4 ?upperRightOffsetY -0.4	)
	list( ?layer list("VIA2" "drawing") ?width 0.5 ?length 0.5
?lowerLeftOffsetX   0.4 ?upperRightOffsetX -0.4  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.4 ?upperRightOffsetY -0.4	)
	list( ?layer list("VIA3" "drawing") ?width 0.5 ?length 0.5
?lowerLeftOffsetX   0.5 ?upperRightOffsetX -0.5  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.5 ?upperRightOffsetY -0.5	)
	    ))

;; deuxi�me P2M4Cont
	rodCreateRect(?cvId pcCellView ?layer list("MET2" "drawing")
		?bBox list((4.75:183.85)(26.25+(width-1.0):218.8)))
	rodCreateRect(?cvId pcCellView ?layer list("MET3" "drawing")
		?bBox list((4.75:183.85)(26.25+(width-1.0):218.8)))

;; MET1 + tous les VIAS et CONT
	rodCreateRect(?cvId pcCellView ?layer 35
		?bBox list((4.75:183.85)(26.25+(width-1.0):218.8))
?subRectArray list(
	list( ?layer list("CONT" "drawing") ?width 0.4 ?length 0.4
?lowerLeftOffsetX   0.4 ?upperRightOffsetX -0.4  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.4 ?upperRightOffsetY -0.4	)
	list( ?layer list("VIA1" "drawing") ?width 0.5 ?length 0.5
?lowerLeftOffsetX   0.4 ?upperRightOffsetX -0.4  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.4 ?upperRightOffsetY -0.4	)
	list( ?layer list("VIA2" "drawing") ?width 0.5 ?length 0.5
?lowerLeftOffsetX   0.4 ?upperRightOffsetX -0.4  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.4 ?upperRightOffsetY -0.4	)
	list( ?layer list("VIA3" "drawing") ?width 0.5 ?length 0.5
?lowerLeftOffsetX   0.5 ?upperRightOffsetX -0.5  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.5 ?upperRightOffsetY -0.5	)
	    ))

;; < Metx max Width rule
when( rwidth>= 12.2 rwidth = 12.2)

;; MET2 pour ralonger vers contacts du bas => diminuer resistance acces
	rodCreateRect(?cvId pcCellView ?layer list("MET2" "drawing")
		?bBox list((4.75:6.45) (26.4+rwidth:183.85)))

;; MET1 plus contants en plus
	rodCreateRect(?cvId pcCellView ?layer list("MET1" "drawing")
		?bBox list((4.75:6.45) (26.4+rwidth:105.35))
?subRectArray list(
	list( ?layer list("CONT" "drawing") ?width 0.4 ?length 0.4
?lowerLeftOffsetX   0.4 ?upperRightOffsetX -0.4  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.4 ?upperRightOffsetY -0.4	)
	list( ?layer list("VIA1" "drawing") ?width 0.5 ?length 0.5
?lowerLeftOffsetX   0.4 ?upperRightOffsetX -0.4  ?spaceX 0.45 ?spaceY 0.45
?lowerLeftOffsetY   0.4 ?upperRightOffsetY -0.4	)
	    )
);end MET1 array

);; end when create contact : ( P2M4Cont )
); end when existance capa (width > -20)
);; end when cap

rectBorder = rodCreateRect(?cvId pcCellView ?layer 35
		?bBox list((0.0:0.0) ((30.0 + width):0.5)))

;rectBoundary = rodCreateRect(?cvId pcCellView ?layer list("prBoundary" "drawing")
;		?bBox list((0.0:260.45) ((30.0 + width):261.15)))



;; ** definition des rod handles  **

rodAssignHandleToParameter(
	?parameter "width"
	?rodObj rectBorder
	?handleName list("centerRight" "centerLeft")
	?displayName "width"
	;[?displayExpression S_displayExpression]
	?stretchDir "x"
	?stretchType "relative"
	?moveOrigin t
	;[?updateIncrement f_updateIncrement]
	;[?userData g_userData]
	;[?userFunction Sl_userFunction]
) ; end rodAssignHandleToParameter

t
); end let
); end procedure : create layout


;--------------------------------------------------------------------
; Now the symbol
;--------------------------------------------------------------------
;pcellId=pcDefinePCell(list(ddGetObj(library) cell "symbol" "schematicSymbol")
;----------------------------------------------------------------
; Formal parameters
;----------------------------------------------------------------
;((width 1.0) (cap "TRUE")))
;dbSave(pcellId) dbClose(pcellId)

);fin let global
