   10 rem *******************************
   20 rem *    i n s p e k t o r        *
   30 rem *                             *
   40 rem * fuer    c16/116    von      *
   50 rem *                             *
   60 rem *      andreas zilla          *
   70 rem *******************************
   80 input"{clr}ihren namen bitte 1-6 zeichen";nn$
   90 iflen(nn$)>6thennn$=left$(nn$,6)
  100 dimoz(5,9)
  110 na$(1)="heinz":na$(2)="petra":na$(3)="lukas"
  120 na$(4)="tilly":na$(5)="peter":ra$(1)="garage":ra$(2)="schlaf":ra$(3)="kinder"
  130 ra$(4)="kueche":ra$(5)="gaeste":ra$(6)="keller"
  140 print"{clr}"
  150 char,11,0,"{flon}i n s p e k t o r{flof}"
  160 char,1,6,"ihre aufgabe in diesem adventure ist es,"
  170 char,1,7,"einen moerder zu entlarven."
  180 char,1,8,"auf einer party wurde der gastgeber"
  190 char,1,9,"'george'umgebracht.als taeter kommen"
  200 char,1,10,"folgende personen in frage."
  210 char,1,12,"peter,petra,tilly,lukas,heinz"
  220 char,1,14,"versuchen sie durch fragen,den"
  230 char,1,15,"moerder,das mordzimmer und die"
  240 char,1,16,"tatzeit zu ermitteln."
  245 char,1,17,"die tatzeit liegt zwischen 1 und 9"
  250 char,1,19,"{flon}bitte druecken sie eine taste{flof}"
  260 getkeyc$
  270 print"{clr}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-I}{CBM-I}{CBM-I}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-I}{CBM-I}{CBM-I}{CBM-+}{CBM-+}{CBM-+}xxxxx"
  280 print"{CBM-+}    {CBM-+}          {rvon}{CBM-K}{rvof}        {CBM-+}xxxxx"
  290 print"{CBM-+}       gaeste  {rvon}{CBM-K}{rvof} keller {rvon}{CBM-L}{rvof}xxxxx"
  300 print"{CBM-+}               {CBM-+}/{CBM-+}{CBM-+}     {rvon}{CBM-L}{rvof}xxxxx"
  310 print"{CBM-+}    {CBM-+}    {CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}C{CBM-+}{CBM-+}     {CBM-+}xxxxx{CBM-+}{CBM-+}"
  320 print"{CBM-+}    {CBM-+}    /BBBBBBB {CBM-+}     {CBM-+}      {CBM-+}"
  330 print"{CBM-+}    {CBM-+}    {CBM-+}        {CBM-+}     {CBM-+}      {CBM-+}"
  340 print"{CBM-+}    {CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+} {CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}      {CBM-+}"
  350 print"{CBM-+}                        {CBM-+}garage{CBM-+}"
  360 print"{CBM-+}kueche  kinder   schlaf        {CBM-+}"
  370 print"{CBM-+}      {CBM-+}        {CBM-+}        {CBM-+}      {CBM-+}"
  380 print"{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
  390 poke2021,24:poke2022,13:poke2023,0:poke2024,39
  400 forx=1to5
  410 oz(x,1)=int(6*rnd(1))+1
  420 nextx
  430 forx=2to9
  440 fory=1to5
  450 a=int(6*rnd(1))+1
  460 ifa=oz(y,x-1)then450
  470 oz(y,x)=a
  480 nexty
  490 nextx
  500 mu=int(5*rnd(1))+1
  510 tz=int(9*rnd(1))+1
  520 ra=oz(mu,tz)
  530 ifmu=1then580
  540 forx=1tomu-1
  550 ifoz(x,tz)=rathenoz(x,tz)=int(5*rnd(1))+1:goto550
  560 nextx
  570 ifmu=5then610
  580 forx=mu+1to5
  590 ifoz(x,tz)=rathenoz(x,tz)=int(5*rnd(1))+1:goto590
  600 nextx
  610 rem *** beginn ***
  620 print"{clr}wen wollen sie denn nun als            "
  630 print"naechstes verhoeren ? ";:inputv$
  640 forx=1to5
  650 ifv$=na$(x)then700
  660 nextx
  670 printv$" ist aber nicht dabei gewesen!":forx=1to3000:nextx
  680 print"{clr}"
  690 goto620
  700 v=x
  710 print"{clr}was wollen sie "v$" fragen ?   "
  720 print"1.wo "v$" zu einer best. zeit war ?"
  730 print"2.wann "v$" wo gewesen ist"
  740 :
  750 print"3.fall geloest !!!
  760 getkeya$
  770 x=val(a$)
  780 ifx<1then760
  790 ifx>3then760
  800 gosub1810
  810 onxgoto820,1060,1320
  820 print"{clr}"v$" wo waren sie um ";:inputzt:print:a1=a1+1
  830 ifzt<1thenprint"{up}{up}":goto820
  840 ifzt>9thenprint"{up}{up}":goto820
  850 ifv=muthen870
  860 goto890
  870 ifrnd(1)<.5then890
  880 lu=int(5*rnd(1))+1:goto900
  890 lu=oz(v,zt)
  900 print"-ich war zu der zeit im "ra$(lu)"-raum!"
  910 ifrnd(1)>.2then940
  920 ifzt>tzthenprint"-um"zt"uhr war george schon tot!":goto940
  930 print"-um"zt"uhr lebte unser gastgeber noch!"
  940 forx=1to5
  950 ifx=vthen970
  960 ifoz(x,zt)=luthenprint"-ich war im "ra$(lu)"-raum mit "na$(x)
  970 nextx
  980 forx=1to5
  990 ifv=xthen1010
 1000 ifoz(x,zt)=lu-1oroz(x,zt)=lu+1thenprint"-ich konnte "na$(x)" sehen!"
 1010 nextx
 1020 print"{down}taste"
 1030 poke239,0:wait239,1:poke239,0
 1040 print"{clr}":gosub1820
 1050 goto620
 1060 gosub1820
 1070 print"{clr}"v$", wann waren sie in raum-";:inputr$:print:a1=a1+1
 1080 forx=1to6
 1090 ifr$=ra$(x)then1110
 1100 nextx:print"{up}{up}":goto1060
 1110 w=x
 1120 forx=1to5
 1130 ifna$(x)=v$then1150
 1140 nextx
 1150 v=x
 1160 ifv=mugoto1180
 1170 goto1260
 1180 ifra=wthen1200
 1190 goto1230
 1200 x=int(rnd(1)*9)+1
 1210 print"-ich war um"x" uhr im "ra$(w)"-raum!"
 1220 goto1020
 1230 ifrnd(1)<.5then1260
 1240 x=int(rnd(1)*9)+1
 1250 ifrnd(1)<.5thenprint"-ich war um"x"uhr im "ra$(w)" raum!":goto1020
 1260 x1=0:forx=1to9
 1270 ifoz(v,x)=wthenprint"-ich war um"x"uhr im "ra$(w)"-raum!":x1=1
 1280 nextx
 1290 ifx1=0then1310
 1300 goto1020
 1310 print"-ich war zu keiner zeit im "ra$(w)"-raum":goto1020
 1320 print"{clr}"
 1330 print"mr."nn$" - wollen sie sagen, dass sie"
 1340 printv$" in verdacht haben ?"
 1350 printtab(5)"{down}nennen sie:"
 1360 print"{down}{rght}{rght}{rght}1. den moerder ?"
 1370 print"{rght}{rght}{rght}2. die tatzeit ?"
 1380 print"{rght}{rght}{rght}3. das mordzimmer ?"
 1390 print"{rght}{rght}{rght}4. wissen sie nicht weiter ?"
 1400 getkeya$
 1410 x=val(a$):print"{down}"
 1420 print"{clr}"
 1430 onxgoto1440,1530,1610,1750
 1440 a2=a2+1
 1450 ifv=muthen1470
 1460 print"leider ist "na$(v)" nicht der moerder!":goto1490
 1470 print"{down}"nn$" ,du hast recht!"
 1480 print"in der tat! "na$(v)" ist der moerder!":l=l+1
 1490 forxx=1to3000:nextxx:print"{down}"
 1500 print"{clr}"
 1510 ifl=3then1710
 1520 goto620
 1530 print"wann geschah der mord ? ";:inputzt
 1540 a2=a2+1
 1550 ifzt=tzthenprint"{down}fantastisch! die mordzeit stimmt!":l=l+1:goto1570
 1560 print"{down}leider nicht!"
 1570 forxx=1to3000:nextxx:print"{down}"
 1580 print"{clr}"
 1590 ifl=3then1710
 1600 goto620
 1610 print"welches ist das mordzimmer ? ";:inputr$:a2=a2+1
 1620 forx=1to6
 1630 ifr$=ra$(x)then1650
 1640 nextx:print"{up}{up}":gosub1820:goto1610
 1650 ifx=rathenprint"{down}richtig "nn$", dies ist das mordzimmer!":l=l+1:goto1670
 1660 print"{down}sie muessen sich geirrt haben!"
 1670 forxx=1to3000:nextxx:print"{down}"
 1680 print"{clr}"
 1690 ifl=3then1710
 1700 goto620
 1710 print"{clr} herzlichen glueckwunsch "nn$", du hast "
 1720 print" den mordfall geloest."
 1730 :
 1740 end
 1750 print"{clr}ich bin enttaeuscht von dir"
 1760 printnn$" !!!{down}{down}"
 1770 print"{down}folgendes hat sich zugetragen:"
 1780 printtab(5)"{down}um"tz"hat "na$(mu)" den gastgeber george"
 1790 printtab(5)"im "ra$(ra)"-raum umgebracht!"
 1800 print"{down}{down}{down}":end
 1810 print"{clr}"
 1820 return
