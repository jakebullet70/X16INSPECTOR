    1 rem todo - sound line 3190,3210,3230
    2 rem todo - add joystick - 5000
   10 dim 3: gosub 0,0
   25 rem poke56322,224
   40 rem  poke53287,1:poke53288,1
   50 rem  poke53277,2:poke53271,2
   60 rem  poke53276,0
   80 rem  print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}             {wht}{rvon} please wait! {rvof}"
   90 rem:  fori=248to254:forj=0to62:readd:poke(i*64)+j,d:nextj:nexti
   95 stop:wait 3,1
  100 rem: poke 2040,248
  110 dimmn$(6):dimna$(5):dimra$(6):dimfc(3):dimoz(5,9)
  120 na$(1)="henry":na$(2)="sarah":na$(3)="lucas"
  130 na$(4)="emily":na$(5)="peter":ra$(1)="garage":ra$(2)="bedroom"
  140 ra$(3)="children's room":ra$(4)="kitchen":ra$(5)="guestroom"
  150 ra$(6)="basement"
  160 rx%(1)=296:ry%(1)=126:rx%(2)=220:ry%(2)=126:rx%(3)=148:ry%(3)=126
  170 rx%(4)=76:ry%(4)=126:rx%(5)=128:ry%(5)=86:rx%(6)=228:ry%(6)=86
  180 print "  {rvon}{lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   "
  190 print "   {rvon}{lred}{CBM-K}{yel} {rvof} {rvon}{lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {rvof}  {rvon}{lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {rvof}  {rvon}{lred}{CBM-K}{yel} {rvof}   {rvon}{lred}{CBM-K}{yel} {rvof} {rvon}{lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {lred}{CBM-K}{yel} "
  200 print "   {rvon}{lred}{CBM-K}{yel} {rvof} {rvon}{lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}  {rvof} {rvon}{lred}{CBM-K}{yel} {rvof}   {rvon}{lred}{CBM-K}{yel} {rvof} {rvon}{lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {lred}{CBM-K}{yel} "
  210 print "   {rvon}{lred}{CBM-K}{yel} {rvof} {rvon}{lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {rvof}  {rvon}{lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {rvof}  {rvon}{lred}{CBM-K}{yel} {rvof}  {rvon}{lred}{CBM-K}{yel} {rvof}   {rvon}{lred}{CBM-K}{yel} {rvof} {rvon}{lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {lred}{CBM-K}{yel} "
  220 print "  {rvon}{lred}{CBM-K}{yel}   {lred}{CBM-K}{yel} {lred}{CBM-K}{yel} {lred}{CBM-K}{yel}   {lred}{CBM-K}{yel} {rvof}  {rvon}{lred}{CBM-K}{yel}   {lred}{CBM-K}{yel}   {rvof} {rvon}{lred}{CBM-K}{yel} {rvof} {rvon}{lred}{CBM-K}{yel}   {lred}{CBM-K}{yel} "
  221 print "{down}{lgrn}1979 {gry2}original type-in        {cyn}ron carlson";
  222 print "{lgrn}1987 {gry2}plus/4 version        {cyn}andreas zilla";
  223 print "{lgrn}2024 {gry2}c64 version           {cyn}gergely sinko";
  224 print "{lgrn}2024 {gry2}x16 version      {cyn}steve de george sr"
  230 print"{wht}{down} your task in this adventure is to     "
  240 print" expose a murderer. the host {rvon}george{rvof}  "
  250 print" was killed at a party. the following  "
  260 print" people are possible perpetrators:     "
  270 print" {rvon}henry{rvof}, {rvon}sarah{rvof}, {rvon}lucas{rvof}, {rvon}emily{rvof}, {rvon}peter{rvof}.    "
  280 print"{down} try to find out the murderer, the     "
  290 print" murder room and the time of the crime "
  300 print" by asking questions. the crime "
  310 print" happened between 1 and 9'o clock.{down}"
  320 wait 27,10:print"{lred}press fire to continue{wht}"
  321 wait 28,3:print"{red}use joystick in port 2 (or keyboard){wht}";
  330 and 20:gosub 5000:if j$<>"f" then 330
  340 gosub3190
  350 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}             {rvon} please wait! {rvof}"
  360 forx=1to5
  370 oz(x,1)=int(6*rnd(1))+1
  380 nextx
  390 forx=2to9
  400 fory=1to5
  410 a=int(6*rnd(1))+1
  420 ifa=oz(y,x-1)then410
  430 oz(y,x)=a
  440 next y
  450 nextx
  460 mu=int(5*rnd(1))+1
  470 tz=int(9*rnd(1))+1
  480 ra=oz(mu,tz)
  490 ifmu=1then540
  500 forx=1tomu-1
  510 ifoz(x,tz)=rathenoz(x,tz)=int(5*rnd(1))+1:goto510
  520 nextx
  530 ifmu=5then570
  540 forx=mu+1to5
  550 ifoz(x,tz)=rathenoz(x,tz)=int(5*rnd(1))+1:goto550
  560 nextx
  570 rl=int(5*rnd(1))+1
  571 ifrl=ra then570
  572 zl=int(6*rnd(1))+1
  573 ifzl=tz then572
  590 stop:print"{rvon}{grn}             {gry3}                       {grn}    ";
  600 print"{rvof}{rvon}       {rvof}                        {rvon}  {gry3}   {grn}    ";
  610 print"{rvof}{rvon}       {rvof} {rvon} {cyn}LL{grn}  {brn}{CBM-G}{grn}  {cyn}LL{grn} {rvof}   {rvon}{gry1}        {rvof} {rvon}{grn}  {gry3}   {grn}    ";
  620 print"{rvof}{rvon}       {rvof} {rvon}     {brn}L{grn}     {rvof}   {rvon}{gry1}        {rvof} {rvon}{grn}  {gry3}   {grn}    ";
  630 print"{rvof}{rvon} {rvof}       {rvon}{lgrn} guestroom {rvof}   {rvon}{gry2}basement{rvof}         {rvon}{grn} ";
  640 print"{rvof}{rvon} {rvof} {rvon}{blu} {cyn}L{blu}   {rvof} {rvon}{lgrn}           {gry1}GGG{gry2}        {rvof} {rvon}  {gry1}{CBM-G}  {gry2}{CBM-G} {rvof} {rvon}{grn} ";
  650 print"{rvof}{rvon} {rvof} {rvon}{blu}     {rvof}  {rvon}{lgrn} {rvof}                     {rvon}{gry2}  {gry1}L{CBM-P}{CBM-P}{gry2}{CBM-G} {rvof} {rvon}{grn} ";
  660 print"{rvof}{rvon} {rvof} {rvon}{lblu}     {blu}  {lgrn} {blu} {rvof} {rvon}{red}       {rvof} {rvon}{brn}         {rvof} {rvon}{gry2} {gry3}       {rvof} {rvon}{grn} ";
  670 print"{rvof}{rvon} {rvof} {rvon}{lblu}     {blu}  {lblu} {blu} {rvof} {rvon}{red}       {rvof} {rvon}{brn}         {rvof} {rvon}{gry2} {gry3}       {rvof} {rvon}{grn} ";
  680 print"{rvof}{rvon} {rvof} {rvon}{lblu} kitchen {blu} {lred} child.{brn} {orng} bedroom {gry2} {gry3} garage {rvof} {rvon}{grn} ";
  690 print"{rvof}{rvon} {rvof} {rvon}{lblu}         {rvof} {rvon}{lred}  room {rvof} {rvon}{orng}         {rvof} {rvon}{gry3}        {rvof} {rvon}{grn} ";
  700 print"{rvof}{rvon} {rvof}                                      {rvon} ";
  710 print"{rvof}{rvon} {yel}  {cyn}L{yel}         {cyn}L{yel}   {cyn}L{yel}   {cyn}LL{yel}   {cyn}LL{yel}           {grn} ";
  720 print"{rvof}{rvon} {yel}                                      {grn} ";
  730 print"{rvof}{rvon}                                        ";
  740 gosub3070:print"{wht}{rvof}   question someone or solve the case.{down}"
  750 fori=1to5:mn$(i-1)=na$(i):print"{gry2}  "mn$(i-1)" "tab(32)"{rvon}{gry1}      ":nexti
  760 mn$(5)="i solved the case!":print"{gry2}  "mn$(5)" "tab(32)"{rvon}{gry1}      "
  770 print"{up}{up}{up}{up}{up}{up}{wht} {rvon} "mn$(0)" ":mn=0
  780 rem:  poke2041,250:poke53250,24:poke53264,2:poke53251,198
  790 rem:  poke53248,128:poke53249,128:poke53269,2
  800 gosub5000
  810 ifj$="u" and mn>0 then mn=mn-1: gosub3190:gosub870
  820 ifj$="d" and mn<5 then mn=mn+1: gosub3190:gosub890
  830 ifmn=5thenpoke2041,249:goto850
  840 poke53269,2:poke2041,250+mn
  850 ifj$="f" then gosub 3190:goto910
  860 goto800
  870 print"{up}{gry2} {rvof} "mn$(mn+1)" "
  880 print"{up}{up}{wht} {rvon} "mn$(mn)" ":return
  890 print"{up}{gry2} {rvof} "mn$(mn-1)" "
  900 print"{wht} {rvon} "mn$(mn)" ":return
  910 ifmn=5then2060
  920 v$=na$(mn+1):v=mn+1:gosub3070
  930 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{wht}what do you want to ask "v$"?"
  940 mn$(0)=" where were you at a certain time? "
  950 mn$(1)=" when were you at a certain place? "
  960 mn$(2)=" ask someone else "
  970 print"{down}{rvof}{gry2}";
  980 fori=0to2:printmn$(i):nexti
  990 mn=0:print"{up}{up}{up}{rvon}{wht}"mn$(mn)
 1000 gosub 5000
 1010 ifj$="f" then gosub3190:goto1090
 1020 ifj$="u" and mn=0 then 1000
 1030 ifj$="d" and mn=2 then 1000
 1040 print"{up}{rvof}{gry2}"mn$(mn)
 1050 ifj$="u"then mn=mn-1:gosub3190:print"{up}{up}{rvon}{wht}"mn$(mn)n$(mn)
 1060 ifj$="d"then mn=mn+1:gosub3190:print"{rvon}{wht}"mn$(mn)
 1080 goto1000
 1090 ifmn=0then1120
 1100 ifmn=1then1590
 1110 ifmn=2then740
 1120 zt=1:gosub3070:fori=1to6:printtab(33)"{gry1}{rvon}      {rvof}":nexti
 1130 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down} [up-down] to select time";
 1140 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
 1150 poke2041,249:poke53264,2:poke53250,32:poke53251,182:poke53269,2
 1160 print"{wht} where were you at {rvon}";str$(zt);" {rvof}'o clock?"
 1170 gosub 5000
 1180 ifj$="u" and zt<9thenzt=zt+1:gosub3190:print"{up}";:goto1160
 1190 ifj$="d" and zt>1thenzt=zt-1:gosub3190:print"{up}";:goto1160
 1200 ifj$="f" then:gosub3190:goto1240
 1210 goto1170
 1220 ifv=muthen1240
 1230 goto1310
 1240 gosub3070
 1250 fori=1to6:printtab(33)"{gry1}{rvon}      ":nexti
 1260 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{gry2} ";na$(v);" at";str$(zt);"'o clock{wht}{down}":tx=0
 1270 poke2041,249+v:poke53264,2:poke53250,32:poke53251,182:poke53269,2
 1280 ifv=muandoz(v,zt)=ra then1300
 1290 goto1310
 1300 lu=rl:goto1320
 1310 lu=oz(v,zt)
 1320 tx$="i was in the "+ra$(lu)+".":gosub3140:and 32:tx=tx+1
 1330 poke53249,ry%(lu)
 1340 ifrx%(lu)<=255thenpoke53264,2:poke53248,rx%(lu):goto1360
 1350 poke53264,3:poke53248,rx%(lu)-255
 1360 poke53269,3
 1370 ifrnd(1)>.3then1410
 1375 ifv=muandzt>zlthentx$="by then george was already dead.":gosub3140:goto1400
 1378 ifv=muthentx$="by then george was still alive.":gosub3140:goto1400
 1380 ifzt>tzthentx$="by then george was already dead.":gosub3140:goto1400
 1390 tx$="by then george was still alive.":gosub3140
 1400 and 32:tx=tx+1
 1410 fori=1to5
 1420 ifv=ithen1470
 1430 ifoz(i,zt)=luthen1450
 1440 goto1470
 1450 tx=tx+1:iftx=5thengosub3100:gosub1560
 1460 tx$=na$(i)+" was also there.":gosub3140:and 32
 1470 nexti
 1480 fori=1to5
 1490 ifi=vthen1540
 1500 ifoz(i,zt)=lu-1oroz(i,zt)=lu+1then1520
 1510 goto1540
 1520 tx=tx+1:iftx=5thengosub3100:gosub1560
 1530 tx$="i saw "+na$(i)+" nearby.":gosub3140:and32
 1540 nexti
 1550 gosub3100:gosub3070:goto740
 1560 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
 1570 fora=1to5:print"{rvof}                                ":nexta
 1580 print"{up}{up}{up}{up}{up}";:tx=0:return
 1590 gosub3070:fori=1to6:printtab(32)"{gry1}{rvon}      ":nexti:print"{up}{up}{up}{up}{up}{up}";
 1600 print"{wht} when were you in the...{down}{gry2}"
 1610 fori=1to6:print" "ra$(i):nexti
 1620 poke2041,249:poke53264,3:poke53250,24:poke53251,182
 1630 print"{up}{up}{up}{up}{up}{up}{rvon}{wht}"left$(" "+ra$(1)+"          ",17):mn=0
 1640 poke53249,ry%(1):poke53248,rx%(1)-255:poke53269,3
 1650 gosub5000
 1660 ifj$="f" then:gosub3190:goto1820
 1670 ifj$="u" andmn=0then1650
 1680 ifj$="d" andmn=5then1650
 1690 print"{up}{rvof}{gry2}"left$(" "+ra$(mn+1)+"               ",17)
 1700 ifj$="u" thenmn=mn-1:gosub3190:gosub1720:goto1650
 1710 ifj$="d" thenmn=mn+1:gosub3190:gosub1770:goto1650
 1720 print"{up}{up}{rvon}{wht}"left$(" "+ra$(mn+1)+"               ",17)
 1730 poke53269,2:poke53249,ry%(mn+1)
 1740 ifrx%(mn+1)<=255thenpoke53264,2:poke53248,rx%(mn+1):goto1760
 1750 poke53264,3:poke53248,rx%(mn+1)-255
 1760 poke53269,3:return
 1770 print"{rvon}{wht}"left$(" "+ra$(mn+1)+"               ",17)
 1780 poke53269,2:poke53249,ry%(mn+1)
 1790 ifrx%(mn+1)<=255thenpoke53264,2:poke53248,rx%(mn+1):goto1810
 1800 poke53264,3:poke53248,rx%(mn+1)-255
 1810 poke53269,3:return
 1820 gosub3070:fori=1to6:printtab(33)"{rvon}{gry1}      ":nexti:print"{up}{up}{up}{up}{up}{up}";
 1830 poke2041,249+v:poke53250,32:poke53251,182
 1840 ifrx%(mn+1)<=255thenpoke53264,2:poke53248,rx%(mn+1):goto1860
 1850 poke53264,3:poke53248,rx%(mn+1)-255
 1860 poke53269,3
 1870 print"{wht}";:j=0
 1890 fori=1to9
 1900 ifoz(v,i)=mn+1andv=muandi=tzthen1915
 1910 ifoz(v,i)=mn+1thenj=1
 1915 nexti
 1920 ifj=0then2040
 1930 tx=0
 1940 fori=1to9
 1950 ifoz(v,i)=mn+1andv=muandi=tzthen2010
 1960 ifoz(v,i)=mn+1thentx=tx+1:goto1980
 1970 goto2010
 1980 iftx=5thengosub3100:gosub1560
 1990 iftx=1thentx$="i was in the "+ra$(mn+1)+" ...":gosub3140
 2000 tx$="at"+str$(i)+"'o clock":gosub3140:and 32:x1=1
 2010 nexti
 2020 ifx1=0then2040
 2030 gosub3100:gosub3070:goto740
 2040 tx$="i never was there.":gosub3140
 2050 gosub3100:gosub3070:goto740
 2060 gosub3070:fori=1to6:printtab(29)"{rvon}{gry1}      ":nexti
 2070 printtab(29)"{rvof}{gry2}"right$("      "+na$(1),6):printtab(27)"1'o clock"
 2080 wait17,3: print"{wht}inspector, are you saying"
 2090 wait18,3: print"you solved this case?{down}{gry2}"
 2100 mn$(0)="   more questions   "
 2104 mn$(1)="<    the killer    >":fc(1)=1
 2110 mn$(2)="<     the time     >":fc(2)=1
 2113 mn$(3)="<     the room     >":fc(3)=1
 2120 mn$(4)="   solve the case   "
 2130 rem:   poke2041,250:poke53264,1:poke53250,255:poke53251,182
 2140 rem:   poke53248,rx%(1)-255:poke53249,ry%(1):poke53269,3
 2145 wait 21,11
 2150 fori=0to4:printtab(3);mn$(i):nexti
 2160 printtab(3)"{up}{up}{up}{up}{up}{rvon}{wht}";mn$(0):mn=0
 2170 gosub 5000
 2180 ifj$="u" andmn=0then2170
 2190 ifj$="d" andmn=4then2170
 2200 ifj$="u" orj$="d"  thenprinttab(3)"{up}{rvof}{gry2}";mn$(mn)
 2210 ifj$="u" thenmn=mn-1:gosub3190:printtab(3)"{rvon}{wht}{up}{up}";mn$(mn)
 2220 ifj$="d" thenmn=mn+1:gosub3190:printtab(3)"{rvon}{wht}";mn$(mn)
 2230 ifj$="f" andmn=0thengosub3190:goto740
 2240 ifj$="f" andmn=4thengosub3190:goto2470
 2250 ifmn=1thengosub2290
 2260 ifmn=2thengosub2350
 2270 ifmn=3thengosub2400
 2280 goto2170
 2290 ifj$<>"l" and j$<>"r" then return
 2300 ifj$="l" andfc(1)>1thengosub3190:fc(1)=fc(1)-1
 2310 ifj$="r" andfc(1)<5thengosub3190:fc(1)=fc(1)+1
 2320 gosub 5100:wait 23,31
 2330 print"{gry2}"+na$(fc(1)):wait x,y:return
 2331 rem nput print"{gry2}"right$("      "+na$(fc(1)),6):locate x,y
 2340 rem poke2041,249+fc(1):return -- 2041 is a sprite
 2350 ifj$<>"l" andj$<>"r" thenreturn
 2360 ifj$="l" andfc(2)>1thengosub3190:fc(2)=fc(2)-1
 2370 ifj$="r" andfc(2)<9thengosub3190:fc(2)=fc(2)+1
 2380 gosub 5100: wait 24,27
 2390 print"{gry2}"str$(fc(2))"'o clock":wait x,y:return
 2400 ifj$<>"l" andj$<>"r" thenreturn
 2410 ifj$="l" andfc(3)>1thengosub3190:fc(3)=fc(3)-1
 2420 ifj$="r" andfc(3)<6thengosub3190:fc(3)=fc(3)+1
 2430 rem - sprite stuff poke53269,2:poke53249,ry%(fc(3))
 2440 ifrx%(fc(3))>255thenpoke53264,1:poke53248,(rx%(fc(3)))-255:goto2460
 2450 poke53264,0:poke53248,rx%(fc(3))
 2460 poke53269,3:return
 2470 l=0:gosub3070
 2480 and32
 2490 iffc(1)=muthen2510
 2500 print" {rvon}{red} x {rvof}{wht} no, "na$(mu)" is the real killer!{down}":goto2520
 2510 print" {rvon}{grn} W {rvof}{wht} yes, "na$(fc(1))" is the killer!{down}":l=l+1
 2520 and64
 2530 iffc(2)=tzthen2550
 2540 print" {rvon}{red} x {rvof}{wht} no, the correct time is";str$(tz)"'o clock.{down}":goto2560
 2550 print" {rvon}{grn} W {rvof}{wht}";str$(fc(2));"'o clock is the correct time.{down}":l=l+1
 2560 and64
 2570 iffc(3)=rathen2600
 2580 print" {rvon}{red} x {rvof}{wht} you're wrong, the real murder room"
 2590 print"     is the ";ra$(ra):goto2630
 2600 print" {rvon}{grn} W {rvof}{wht} the "ra$(fc(3))" is where"
 2610 print"     the murder took place.":l=l+1
 2620 and64
 2630 gosub3100:gosub3070
 2640 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{gry3}{rvon}{rght}                                      "
 2650 print"{rvon}{rght}                                      "
 2660 tx$="from: boss":gosub3010
 2670 tx$="to: inspector":gosub3010
 2680 fori=1to2:tx$=" ":nexti:gosub3010
 2690 ifl=3then2910
 2700 ifl>=1andfc(1)=muthen2770
 2710 ifl>=1andfc(1)<>muthen2830
 2720 tx$=" not only did you accuse the wrong":gosub3010
 2730 tx$="person but you were wrong about all":gosub3010
 2740 tx$="the details of this case. at this":gosub3010
 2750 tx$="point i have to question your skill":gosub3010
 2760 tx$="as an investigator.":gosub3010:goto2960
 2770 tx$=" though i'm sure you identified the":gosub3010
 2780 tx$="killer correctly, there isn't enough":gosub3010
 2790 tx$="certainty for "+na$(mu)+" to be taken into":gosub3010
 2800 tx$="custody. i'm very disappointed that":gosub3010
 2810 tx$="the case ended like this and the":gosub3010
 2820 tx$="culprit is still walking free.":gosub3010:goto2960
 2830 tx$=" you managed to figure out "
 2840 ifl=1thentx$=tx$+"some of":goto2860
 2850 tx$=tx$+"all of"
 2860 gosub3010:tx$="the details of this case, but failed":gosub3010
 2870 tx$="to identify the killer correctly,   ":gosub3010
 2880 tx$="and because of that justice cannot  ":gosub3010
 2890 tx$="be properly served. i'm not at all  ":gosub3010
 2900 tx$="satisfied with this outcome.":gosub3010:goto2960
 2910 tx$=" congratulations for successfully   ":gosub3010
 2920 tx$="solving this case! the perpetrator  ":gosub3010
 2930 tx$="was arrested. "+na$(mu)+" will now  ":gosub3010
 2940 tx$="face trial and the case is solid    ":gosub3010
 2950 tx$="enough for an assured conviction.   ":gosub3010
 2960 fori=1to2:print"{rght}{rvon}                                      ":nexti
 2970 fori=1to2:print"":nexti
 2980 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{lred}          fire to start again{wht}{up}"
 2990 gosub5000:ifj$<>"f"then2990
 3000 goto180
 3010 print"{rght}{rvon}                                      ":print"{up}{rght}{rght}";
 3020 fora=1tolen(tx$):
 3030 ifmid$(tx$,a,1)=" "thenprint"{rvon} ";:goto3050
 3040 j=int(asc(mid$(tx$,a,1))/5):gosub3230:print"{rvon}"mid$(tx$,a,1);
 3050 and 3:nexta:print""
 3060 print"{rght}{rvon}                                      ":print"{up}{rght}{rght}":return
 3070 print"{rvof}{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";:poke53269,0
 3080 fora=1to8:print"                                       ":nexta
 3090 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";:return
 3100 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{lred}            fire to continue           {wht}{up}"
 3110 gosub5000:ifj$<>"f"then3110
 3120 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}                                       {up}"
 3130 return
 3140 fora=1tolen(tx$)
 3150 ifmid$(tx$,a,1)=" "thenprint" ";:nexta
 3160 j=int(asc(mid$(tx$,a,1))/3):gosub3210:printmid$(tx$,a,1);
 3170 nexta
 3180 print"":return
 3190 rem: fmplay 0,"a1": rem sound here
 3200 return
 3210 rem:fmplay 0,"d1": rem sound here
 3220 return
 3230 rem:fmplay 0,"e9": rem sound here
 3240 return
 3250 data 0,0,0,112,0,0,120,0,0,60,6,0,30,14,0,15,14,0,7,142,0,3,206,0,5,254,0
 3260 data 14,254,0,7,254,0,11,254,0,31,254,0,15,254,0,19,253,128,15,251,0,3,246
 3270 data 0,0,108,0,0,8,0,0,0,0,0,0,0
 3280 data 1,206,0,3,191,0,3,255,0,7,255,128,6,0,0,1,255,128,127,225,248,60,24,0
 3290 data 3,252,96,4,70,224,6,239,224,7,255,64,7,63,0,3,254,0,3,12,0,1,248,0,0
 3300 data 241,64,2,2,224,10,133,216,23,123,220,55,183,220
 3310 data 7,255,192,8,0,32,16,0,16,16,0,16,16,0,16,8,0,16,7,254,16,0,134,16,6
 3320 data 48,0,6,183,144,0,135,160,7,255,128,6,127,0,7,254,0,7,254,0,6,60,0,3
 3330 data 249,0,1,241,0,0,3,0,3,7,96,7,126,112
 3340 data 3,254,0,12,1,0,16,0,128,32,0,128,32,0,64,32,0,64,16,254,64,15,246,64
 3350 data 3,206,64,9,158,160,15,255,160,15,255,32,14,254,208,7,254,72,7,252,72
 3360 data 3,56,68,3,240,68,1,228,36,0,12,36,2,29,20,14,253,212
 3370 data 0,255,0,3,0,192,12,0,32,16,0,0,8,0,32,16,0,32,32,28,0,16,62,32,7,254
 3380 data 0,4,71,96,6,239,224,7,255,224,7,255,64,7,31,0,6,15,0,2,238,0,2,236,0
 3390 data 0,233,0,0,3,0,5,7,176,13,255,56
 3400 data 1,255,0,2,0,128,4,0,64,8,0,64,8,2,32,8,4,32,19,248,32,23,252,32,23
 3410 data 252,16,16,140,144,20,157,144,23,253,144,23,255,16,19,126,16,19,254
 3420 data 16,11,60,16,9,248,16,8,224,16,8,4,16,19,29,200,38,251,232
 3430 data 1,254,0,2,1,0,4,0,128,8,0,64,8,0,64,8,0,64,7,248,64,7,254,64,1,142,64
 3440 data 1,158,128,7,255,128,7,255,0,6,254,0,7,254,0,7,254,0,2,60,0,3,248,0,1
 3450 data 242,0,0,2,0,3,7,96,7,126,112
 5000 v1=(jt):j$="":rem joystick reader
 5010 if v1 and 8 then j$="u"
 5012 if v1 and 4 then j$="d"
 5015 if v1 and 2 then j$="l"
 5018 if v1 and 1 then j$="r"
 5020 if v1 and 16then j$="f"
 5021 rem: locate 33,1:print v1
 5024 if j$<>"" then and 14: return
 5035 goto 5000
 5100 poke $30f,1:rem cursor locations
 5110 sys $fff0
 5120 y=peek($30d)+1
 5130 x=peek($30e)+1
 5140 return
 5200 rem - show suspect pic
 5300 return
 5400 rem - clear solve screen
 5490 return
