unit Mexanic;

interface

uses
Graphics, Types,classes,windows,forms,controls;

type TArcCoords=record
P_start,P_end:TPoint;
end;
type TPoint2=record
x,y:double;
end;

var  masx,masy:double;
     xrrr,yrrr,x000,y000,xx1,yy1,xx2,yy2,xx3,yy3,xx4,yy4:integer;
     P_O,P_O1,P_A,P_B,P_C,P_D,P_E,P_F,P_G,P_H:TPoint2;
        angl_str:integer=15;
        cfona:TColor=clbtnface;
            apol:integer=30;
    hpol:integer=20;
    rej:integer=1;
         cwpolz:TColor=clBlack;
     ArcCoords:TArcCoords;
     ropor:integer=3;

type TMexanic=class(TGraphic)
private
FFlag:byte;
FRadius:integer;
FRadius1:integer;
FRadius2:integer;
FHedel:integer;
FFi:double;
FHedelR:double;
FHandle:THandle;
FCanvas:TCanvas;
Function GetCanvas:TCanvas;
Function GetHandleNew:THandle;

public

Function GetRadius:integer;
procedure SetRadius(value:integer);
Function GetHedel:integer;
procedure SetHedel(value:integer);

procedure SetCanvas(value:TCanvas);
procedure SetFlag(value:byte);

procedure Circle(p:Tpoint; R:word); overload;
procedure Circle(px,py:integer; R:word); overload;
procedure circles(x0,y0,r,co,cf:integer);
procedure opora(n,x0,y0,alf,co:integer);

procedure sila(x0,y0,f,alf,cf:integer);
procedure moment(m,x0,y0,alf,cm:integer);
procedure nagq(q,x0,y0,x1,y1,cq:integer); overload;
procedure nagq(q:integer; P0,P1:Tpoint; cq:integer); overload;
procedure prujina(n,t,x1,y1,x2,y2,cw:integer; k:double=1); overload;
procedure prujina(n,t:integer; p1,p2:TPoint; cw:integer; k:double=1); overload;
procedure dempfer(t,x1,y1,x2,y2,cw:integer); overload;
procedure dempfer(t:integer; p1,p2:TPoint; cw:integer); overload;

procedure Arc(p:Tpoint; R:word; fb,fe:double); overload;
procedure Arc(p:Tpoint; fb,fe:double); overload;
procedure sxwat(p:Tpoint; fi:double);
procedure sxwat2(p:Tpoint; fi:double);
procedure line(p1,p2:TPoint); overload;
procedure line(x1,y1,x2,y2:integer); overload;
procedure linerel(dx,dy:integer);
procedure HedelWW(p1,p2:TPoint;  r1:integer=-1; r2:integer=-1);
procedure GrWWW(p1,p2,p3:TPoint); overload;
procedure GrWWW(x1,y1,x2,y2,x3,y3:integer); overload;
procedure pram(x1,y1,a,b:integer; ksi:double; flag:boolean=true);
procedure Kamen(x0,y0:integer; ksi:double);
procedure HedelWP(p1,p2:TPoint; ksi:double; r1:integer=-1);
procedure GrWWP(p1, p2, p3: TPoint; psi:double); overload;
procedure GrWWP(p1, p2: TPoint; psi:double); overload;
procedure HedelPP(p1,p2:TPoint; ksi1:double; ksi2:double);
procedure GrPWP(p1, p2, p3: TPoint; psi1,psi3:double); overload;
procedure GrPWP(p1, p2: TPoint; psi1,psi3:double); overload;
procedure GrPWP(p1: TPoint; psi1,psi3:double); overload;
procedure GrWPW(p1, p2, p3: TPoint; l:double=0);

procedure wphed(res,r:integer; xi,yi,l,nu:double; cr:tcolor);
procedure masxy(x:double);
function xint(p0:Tpoint; x:double):integer; overload;
function xint(x:double):integer; overload;
function yint(p0:Tpoint; y:double):integer; overload;
function yint(y:double):integer; overload;
procedure ras_line(x1,y1,x2,y2:integer; st:string; dn:integer);
procedure lll(x,y,l,d,a:integer);
procedure sistcoord(x0,y0,f,l1,l2:integer; co:tcolor);
procedure sistcoord1(x0,y0,f,l1,l2:integer; co:tcolor);
procedure napr(P0:TPoint; x0,y0,ksi:double; l1,l2,dl:integer; zl1:boolean); overload;
procedure napr(x0,y0,ksi:double; l1,l2,dl:integer; zl1:boolean); overload;
procedure polzun(alf:double; x0,y0,a,h:integer);
procedure rism1(xo,yo,xa,ya:double; tet:integer);
procedure rism1u(x0,y0,x1,y1:integer; tet:integer=270); overload;
procedure rism1u(p0,p1:Tpoint; tet:integer=270); overload;
procedure stoica(x0,y0:integer; tet:integer=270); overload;
procedure stoica(p0:Tpoint; tet:integer=270); overload;
procedure Mex2WWWW(P:array of TPoint);
procedure Mex3Kl(P:array of TPoint);
procedure Mex4Kl(P:array of TPoint);
function lfiToPoint(p0:TPoint; l,fi:double):Tpoint;
procedure PointToLFi(p1,p2:TPoint; var l,fi:double);
function lfiToPoint_1(p0:TPoint; l,fi:double):Tpoint;
procedure PointToLFi_1(p1,p2:TPoint; var l,fi:double);

procedure risg1(xm,ym,xn,yn,li,fi:double);
procedure ris4w(xa,ya,xd,yd,a,alf,c,gam:double);
procedure risg1u(x1,y1,x2,y2,x3,y3:integer);
procedure risg2(xm,ym,xf,yf,psi,li,fi2,xn2:double);
procedure risg2u(x1,y1,x2,y2,x3,y3:integer; psi:double);
procedure risg3(xm,ym,xn,yn,mt,fk,lk,l:double);
procedure mex0(xi,yi,xj,yj:integer);
procedure mex1(xi,yi,xj,yj:integer);
procedure mex1s(xi,yi,xj,yj,alf:integer);
procedure hedww(xi,yi,xj,yj:integer);
procedure polz(xi,yi,alf:integer);
procedure hedwp(xi,yi,xj,yj,alf:integer);
procedure hedpp(xi,yi,xj,yj,alf,bet:integer);


constructor Create;
destructor Destroy;
property Canvas: TCanvas read GetCanvas;
property HandleNew: THandle read GetHandleNew;
property Radius: integer read GetRadius write setradius;
property Hedel: integer read GetHedel;
end;

function Point2(x,y:double):TPoint2;  overload;
function Point2(P0:TPoint2; x,y:double):TPoint2;  overload;
function Point2_(l,fi:double):TPoint2;  overload;
function Point2_(P0:TPoint2; l,fi:double):TPoint2;  overload;
function P2_Point(P:TPoint2):TPoint; overload;
function P2_Point(PO:TPoint; P:TPoint2):TPoint; overload;
function Hypot2(P1,P2:TPoint2):double;

procedure Delay_Wait(msecs : Longint);

implementation
uses math;

procedure Delay_Wait(msecs : Longint);
var
   FirstTick : longint;
begin
     FirstTick:=GetTickCount;
     repeat
       Application.ProcessMessages;
       {фы  Єюую ўЄюс√ эх "чртхёшЄ№" Windows}
     until GetTickCount-FirstTick >= msecs;
end;

function Point2(x,y:double):TPoint2;
begin
result.x:=x;
result.y:=y;
end;

function Point2(P0:TPoint2; x,y:double):TPoint2;
begin
result.x:=P0.x+x;
result.y:=P0.y+y;
end;

function Point2_(l,fi:double):TPoint2;
begin
result.x:=l*cos(fi);
result.y:=l*sin(fi);
end;

function Point2_(P0:TPoint2; l,fi:double):TPoint2;
begin
result.x:=P0.x+l*cos(fi);
result.y:=P0.y+l*sin(fi);
end;

function P2_Point(PO:TPoint; P:TPoint2):TPoint;
begin
result.x:=PO.x+round(P.x*masx);
result.y:=PO.y-round(P.y*masy);
end;

function P2_Point(P:TPoint2):TPoint;
begin
result.x:=X000+round(P.x*masx);
result.y:=Y000-round(P.y*masy);
end;

function Hypot2(P1,P2:TPoint2):double;
begin
result:=hypot(P2.x-P1.x,P2.y-P1.y);
end;

  procedure prxy(l,a:integer; var x,y:integer);
   var r:double;
   begin
    r:=degtorad(a);
    x:=round(l*cos(r));
    y:=-round(l*sin(r));
   end;

{
  procedure proxy(f,a:double; var x,y:integer);
   var r:double;
   begin
    r:=a*pi/180;
    x:=round(f*cos(r));
    y:=-round(f*sin(r));
   end;
}

  procedure TMexanic.sila(x0,y0,f,alf,cf:integer);
  {pисует силу сходящую в точку}
   var x,y:integer;
   begin
    prxy(f,90+alf,x,y);
    sistcoord(x0+x,y0+y,270+alf,f,0,cf);
   end;

   procedure TMexanic.moment(m,x0,y0,alf,cm:integer);
   {Рисует момент m<0-по часовой, m>0-пpотив часовой стpелки}
    const d=13; f=16;
    var sc,x,y,x1,y1,n:integer;
     begin
      if m<0 then n:=0 else n:=1;
      sc:=FCanvas.Pen.Color;
      FCanvas.Pen.Color:=cm;
      prxy(d,90+alf,x,y);
      FCanvas.moveto(x0,y0);
      linerel(x,y);
      x1:=FCanvas.PenPos.X;
      y1:=FCanvas.PenPos.y;
      sistcoord(x1,y1,alf+n*180,f,0,cm);
      FCanvas.moveto(x0,y0);
      linerel(-x,-y);
      x1:=FCanvas.PenPos.X;
      y1:=FCanvas.PenPos.y;
      sistcoord(x1,y1,alf+(n+1)*180,f,0,cm);
      FCanvas.Pen.Color:=sc;
   end;

   procedure TMexanic.nagq(q:integer; P0,P1:Tpoint; cq:integer);
   begin
    nagq(q,P0.x,P0.y,P1.x,P1.y,cq);
   end;

   procedure TMexanic.nagq(q,x0,y0,x1,y1,cq:integer);
   {Рисует pаспpеделенную нагpузку}
    const del=8;
     var a:double;
         sc,dx,dy,dx1,dy1,i,h:integer;
         d,dx2,dy2:double;
      begin
       if abs(q)<18 then h:=18 else h:=abs(q);
       a:=arctan2(y1-y0,x1-x0);
       dx1:=round(h*sin(a));
       dy1:=round(h*cos(a));
       d:=hypot(x1-x0,y1-y0)/del;
       sc:=FCanvas.Pen.Color;
       FCanvas.Pen.Color:=cq;
       FCanvas.moveto(x0,y0);
       linerel(dx1,-dy1);
       linerel(x1-x0,y1-y0);
       FCanvas.lineto(x1,y1);
       FCanvas.lineto(x0,y0);
       dx2:=(x1-x0)/d;
       dy2:=(y1-y0)/d;
        i:=-1;
        repeat
        i:=i+1;
        if i>=d then begin dx:=x1; dy:=y1 end
           else begin dx:=x0+round(i*dx2); dy:=y0+round(i*dy2) end;
        if q>0 then sila(dx,dy,h,round(-a*180/pi),cq)
            else sistcoord(dx,dy,round(-a*180/pi+90),h,0,cq);
        until (dx=x1) and (dy=y1);
       FCanvas.Pen.Color:=sc;
    end;

   procedure TMexanic.prujina(n,t:integer; p1,p2:TPoint; cw:integer;  k:double=1);
   begin
    prujina(n,t,p1.x,p1.y,p2.x,p2.y,cw);
   end;

 procedure TMexanic.prujina(n,t,x1,y1,x2,y2,cw:integer; k:double=1);
 {pисует пpужину в зависимости от сжатия}
  var r1,r2,dr,dl,alf,bet,s:real;
      sc,i:integer;
   begin
    dr:=10*hypot((x1-x2)/10.0,(y1-y2)/10.0)/n;
       sc:=FCanvas.Pen.Color;
    alf:=arctan2(y2-y1,x2-x1);
    if dr<0.0000001 then dr:=0.0000001;
    bet:=arctan(t/dr);
    dl:=hypot(dr,t);
       FCanvas.Pen.Color:=cw;
       s:=0;
   with  FCanvas do
   begin
    moveto(x1,y1);
    for i:=0 to n do
     begin
      if (i=0) or (i=n) then r1:=dl/2 else r1:=dl;
      if odd(i) then r2:=-bet else r2:=bet;
      if k<>1 then
      begin
      r1:=r1+(k-1)*r1*(i)/n;
      s:=s+r1*cos(bet);
      if s>n*dr then break;
      end;
      linerel(round(r1*cos(alf+r2)),round(r1*sin(alf+r2)));
    end;
    lineto(x2,y2);
    end;
       FCanvas.Pen.Color:=sc;
   end;

   procedure TMexanic.dempfer(t:integer; p1,p2:TPoint; cw:integer);
   begin
    dempfer(t,p1.x,p1.y,p2.x,p2.y,cw);
   end;

   procedure TMexanic.dempfer(t,x1,y1,x2,y2,cw:integer);
   {pисует демpфеp в движении}
   const dd=3;
   var
    sc,x,y:integer;
    dr,alf,s,c:real;
   begin
    sc:=FCanvas.Pen.Color;
    FCanvas.Pen.Color:=cw;
    alf:=arctan2(y2-y1,x2-x1);
    dr:=5*hypot((x2-x1)/10,(y2-y1)/10)-dd;
    s:=sin(alf); c:=cos(alf);
   with FCanvas do
   begin
    moveto(x1,y1);
    linerel(round(dr*c),round(dr*s));
    linerel(round(-t/2*s),round(t/2*c));
    linerel(round(t*s),round(-t*c));
    moveto(x2,y2);
    linerel(-round(dr*c),-round(dr*s));
    x:=penpos.x; y:=penpos.y;
    linerel(round(-(t/2+dd)*s),round((t/2+dd)*c));
    linerel(-round(2*dd*c),-round(2*dd*s));
    moveto(x,y);
    linerel(round((t/2+dd)*s),round(-(t/2+dd)*c));
    linerel(-round(2*dd*c),-round(2*dd*s));
    end;
    FCanvas.Pen.Color:=sc;
   end;

   procedure TMexanic.circles(x0,y0,r,co,cf:integer);
   {Рисует закpашенную окpужность}
    var cr,sc:integer;
     begin
      sc:=FCanvas.Pen.Color;
      cr:=(cf+co) div 2;
      FCanvas.Pen.Color:=cr;
      circle(x0,y0,r);
      FCanvas.Brush.Color:=cf;
      FCanvas.Brush.Style:=bsSolid;
      FCanvas.floodfill(x0,y0,cr,fsBorder);
      FCanvas.Pen.Color:=co;
      circle(x0,y0,r);
      FCanvas.Pen.Color:=sc;
    end;

  procedure TMexanic.opora(n,x0,y0,alf,co:integer);
   //Рисует опоpы 1,-1-подвижная, 2,-2-неподвижная, 3-Заделка
   const  h=12; del=5;
   var sc,a,x,y,x1,y1,x2,y2,dx,dy,i,r0,r1,l:integer;
       d:double;
   begin
    l:=10;
    if n<0 then l:=l+2;
    sc:=FCanvas.Pen.Color;
    FCanvas.Pen.Color:=co;
    if n=0 then
     begin
      circles(x0,y0,ropor,co,cfona);
      FCanvas.Pen.Color:=sc;
      exit;
     end;
    a:=alf+270;
    if (n=2) or (n=1) or (n=-2) then
     begin
      circle(x0,y0,ropor);
      prxy(ropor,a-45,x,y);
      FCanvas.moveto(x+x0,y+y0);
      prxy(l,a-45,x1,y1);
      linerel(x1,y1);
      x1:=FCanvas.PenPos.X;
      y1:=FCanvas.PenPos.y;
      x2:=x1; y2:=y1;
      prxy(ropor,a+45,x,y);
      FCanvas.moveto(x+x0,y+y0);
      prxy(l,a+45,x,y);
      linerel(x,y);
      x:=FCanvas.PenPos.X;
      y:=FCanvas.PenPos.y;
      FCanvas.lineto(x1,y1);
      if n=1 then
       begin
        prxy(2*ropor+2,a,dx,dy);
        x1:=x1+dx; y1:=y1+dy;
        x:=x+dx; y:=y+dy;
        line(x,y,x1,y1);
        r0:=(x1-x) div 4;
        r1:=(y1-y) div 4;
        circle(x+r0-dx div 2,y+r1-dy div 2,ropor);
        circle(x1-r0-dx div 2,y1-r1-dy div 2,ropor);
       end;
      end
      else
       begin
       if abs(n)=3 then
       begin
        prxy(h,90+alf,x,y);
        FCanvas.moveto(x0,y0);
        linerel(x,y);
        x1:=FCanvas.PenPos.X;
        y1:=FCanvas.PenPos.y;
        FCanvas.moveto(x0,y0);
        linerel(-x,-y);
        x:=FCanvas.PenPos.X;
        y:=FCanvas.PenPos.y;
       end;
       if n=-1 then
        begin
      circle(x0,y0,ropor);
      prxy(ropor,a,x,y);
      FCanvas.moveto(x+x0,y+y0);
      prxy(round(l/sqrt(2)),a,x1,y1);
      linerel(x1,y1);
      x2:=FCanvas.PenPos.X;
      y2:=FCanvas.PenPos.y;
      prxy(l+ropor,a-45,x1,y1);
      x1:=x0+x1; y1:=y0+y1;
      prxy(l+ropor,a+45,x,y);
      x:=x0+x; y:=y0+y;
      line(x1,y1,x,y);
        end;
       end;
       d:=hypot(x1-x,y1-y)/del;
       x1:=round((x1-x)/d);
       y1:=round((y1-y)/d);
       prxy(8,alf+225,r0,r1);
       i:=-1;
       repeat
       i:=i+1;
          if i>round(d)  then begin dx:=x1; dy:=y1 end
           else begin dx:=x+i*x1; dy:=y+i*y1 end;
         FCanvas.moveto(dx,dy);
         linerel(r0,r1);
        until (dx=x1) and (dy=y1);
      if (n=-1) or (n=-2) then circles(x2,y2,ropor,co,cfona);
      if n=-2 then circles(x,y,ropor,co,cfona);
       FCanvas.Pen.Color:=sc;
     end;
 
Function TMexanic.GetHandleNew:THandle;
begin
result:=canvas.Handle;
end;


procedure TMexanic.SetCanvas(value:TCanvas);
begin
if FCanvas<>value then
begin
 FCanvas:=value;
end;
end;

Function TMexanic.GetCanvas:TCanvas;
begin
result:=FCanvas;
end;

procedure TMexanic.Circle(p:Tpoint; R:word);
begin
 Canvas.Ellipse(p.X-R,p.Y-R,p.X+R,p.Y+R);
end;

procedure TMexanic.Circle(px,py:integer; R:word);
begin
 Canvas.Ellipse(pX-R,pY-R,pX+R,pY+R);
end;

procedure TMexanic.Arc(p:Tpoint; R:word; fb,fe:double);
var p3,p4:Tpoint;
begin
 p3.X:=p.X+round(R*cos(fb));
 p3.y:=p.y-round(R*sin(fb));
 p4.X:=p.X+round(R*cos(fe));
 p4.y:=p.y-round(R*sin(fe));
 ArcCoords.P_start:=p3;
 ArcCoords.P_end:=p4;
 Canvas.Arc(p.X-R,p.Y-R,p.X+R,p.Y+R,p3.x,p3.y,p4.x,p4.y);
end;

procedure TMexanic.Arc(p:Tpoint; fb,fe:double);
begin
arc(p,getradius+3,fb,fe);
end;

procedure TMexanic.sxwat(p:Tpoint; fi:double);
const u=0.7; L=20;
var dx,dy:integer;
begin
dx:=round(L*cos(fi-u));
dy:=round(L*sin(fi-u));
line(p.x,p.Y,p.X+dx,p.Y+dy);
dx:=round(L*cos(fi+u));
dy:=round(L*sin(fi+u));
line(p.x,p.Y,p.X+dx,p.Y+dy);
end;

procedure TMexanic.sxwat2(p:Tpoint; fi:double);
const u=0.7; L=10;
var dx,dy,dx0,dy0:integer;
begin
dx0:=round(L*cos(fi));
dy0:=round(L*sin(fi));
dx:=round(L*cos(fi-u));
dy:=round(L*sin(fi-u));
line(p.x,p.Y,p.X+dx,p.Y+dy);
linerel(dx0,dy0);
dx:=round(L*cos(fi+u));
dy:=round(L*sin(fi+u));
line(p.x,p.Y,p.X+dx,p.Y+dy);
linerel(dx0,dy0);
end;

Constructor TMexanic.Create;
begin
inherited;
FRadius:=6;
FHedel:=100;
FRadius1:=FRadius;
FRadius2:=FRadius;
FFlag:=3;
end;

destructor TMexanic.Destroy;
begin
inherited;
end;

function TMexanic.GetRadius: integer;
begin
 result:=FRadius;
end;

procedure TMexanic.SetRadius(value: integer);
begin
FRadius:=value;
FRadius1:=FRadius;
FRadius2:=FRadius;
end;

function TMexanic.GetHedel: integer;
begin
result:=FHedel;
end;

procedure TMexanic.SetHedel(value: integer);
begin
FHedel:=value;
end;

procedure TMexanic.HedelWW(p1,p2:TPoint; r1:integer=-1; r2:integer=-1);
var rad1,rad2:integer;
begin
 line(p1,p2);
 if r1<0 then rad1:=FRadius1 else rad1:=r1;
 if r2<0 then rad2:=FRadius2 else rad2:=r2;
 if rad1>0 then
 if (FFlag and 1) <>0 then
 Circle(p1,Rad1);
 if rad2>0 then
 if (FFlag and 2) <>0 then
 Circle(p2,Rad2);
 FHedelR:=hypot(p2.X-p1.X,p2.Y-p1.Y);
 FFi:=arctan2(p1.Y-p2.Y,p2.X-p1.X);
end;

procedure TMexanic.HedelWP(p1,p2:TPoint; ksi:double; r1:integer=-1);
var rad1:integer;
begin
 line(p1,p2);
 if r1<0 then rad1:=FRadius else rad1:=r1;
 if (FFlag and 2) <>0 then
 Kamen(p2.x,p2.y,ksi);
 if rad1>0 then
 if (FFlag and 1) <>0 then
 Circle(p1,Rad1);
 FHedelR:=hypot(p2.X-p1.X,p2.Y-p1.Y);
 FFi:=arctan2(p1.Y-p2.Y,p2.X-p1.X);
end;

procedure TMexanic.HedelPP(p1,p2:TPoint; ksi1:double; ksi2:double);
begin
 line(p1,p2);
 if (FFlag and 2) <>0 then
 Kamen(p2.x,p2.y,ksi2);
 if (FFlag and 1) <>0 then
 Kamen(p1.x,p1.y,ksi1);
 FHedelR:=hypot(p2.X-p1.X,p2.Y-p1.Y);
 FFi:=arctan2(p1.Y-p2.Y,p2.X-p1.X);
end;

procedure TMexanic.line(p1, p2: TPoint);
begin
 canvas.MoveTo(p1.X,p1.Y);
 canvas.LineTo(p2.X,p2.Y);
end;

procedure TMexanic.GrWWW(p1, p2, p3: TPoint);
var r:byte;
begin
 r:=FFlag;
 FFlag:=FFlag and 1;
 HedelWW(p1,p2);
 FFlag:=r;
 HedelWW(p2,p3);
end;

procedure TMexanic.GrWWP(p1, p2, p3: TPoint; psi:double);
var r:byte;
begin
 r:=FFlag;
 FFlag:=FFlag and 2;
 HedelWP(p2,p3,psi);
 FFlag:=r;
 HedelWW(p1,p2);
end;

procedure TMexanic.GrWWP(p1, p2: TPoint; psi:double);
begin
GrWWP(p1,p2,p2,psi);
end;

procedure TMexanic.GrPWP(p1, p2, p3: TPoint; psi1,psi3:double);
var r:byte;
begin
 r:=FFlag;
 FFlag:=FFlag and 2;
 HedelWP(p2,p3,psi3);
 FFlag:=r;
 HedelWP(p2,p1,psi1);
end;

procedure TMexanic.GrWPW(p1, p2, p3: TPoint; l:double=0);
var r:byte;
    dl:double;
begin
 r:=FFlag;
 FFlag:=FFlag and 1;
 HedelWW(p1,p2);
 if l<=0 then
 dl:=apol
 else
 dl:=l-FHedelR;
 if dl<=0 then dl:=apol;
 line(p2,point(round(p2.X+dl*cos(FFi)),round(p2.y-dl*sin(FFi))));
 FFlag:=r;
 HedelWP(p3,p2,FFi);
end;

procedure TMexanic.SetFlag(value: byte);
begin
 FFlag:=value;
end;

procedure TMexanic.line(x1, y1, x2, y2: integer);
begin
 canvas.MoveTo(X1,Y1);
 canvas.LineTo(x2,y2);
end;

procedure TMexanic.GrWWW(x1, y1, x2, y2, x3, y3: integer);
begin
GrWWW(point(x1,y1),point(x2,y2),point(x3,y3));
end;

procedure TMexanic.GrPWP(p1, p2: TPoint; psi1, psi3: double);
begin
GrPWP(p1,p2,p2,psi1,psi3);
end;

procedure TMexanic.GrPWP(p1: TPoint; psi1, psi3: double);
begin
GrPWP(p1,p1,p1,psi1,psi3);
end;

procedure TMexanic.Mex2WWWW(P:array of TPoint);
begin
 rism1u(p[0],p[1]);
 GrWWW(p[1],p[2],p[3]);
 stoica(p[3]);
end;

procedure TMexanic.Mex3Kl(P:array of TPoint);
begin
 rism1u(p[0],p[1]);
 hedelWW(p[1],p[2],-1,0);
 GrWWW(p[2],p[3],p[4]);
 stoica(p[4]);
 GrWWW(p[2],p[5],p[6]);
 stoica(p[6]);
 hedelWW(p[3],p[5]);
end;

procedure TMexanic.Mex4Kl(P:array of TPoint);
begin
 rism1u(p[0],p[1]);
 hedelWW(p[1],p[2],-1,0);
 GrWWW(p[2],p[3],p[4]);
 stoica(p[4]);
 hedelWW(p[1],p[5],-1,0);
 GrWWW(p[5],p[6],p[4]);
 hedelWW(p[2],p[5]);
 hedelWW(p[3],p[6]);
end;

 procedure TMexanic.masxy(x:double);
  begin
   masx:=x;
   masy:=x;
  end;

 procedure TMexanic.wphed(res,r:integer; xi,yi,l,nu:double; cr:tcolor);
 {╨шёєхЄ тpр∙рЄхы№эє■ ярpє ш чтхэю}
 var j:Tcolor;
     x1,y1,x,y,dx,dy:double;
    begin
     dx:=r*cos(nu);
     dy:=r*sin(nu);
     j:=canvas.pen.color;
     canvas.pen.color:=cr;
     x:=xrrr+xi*masx;
     y:=yrrr-yi*masy;
     circle(round(x),round(y),r);
     x1:=x+l*cos(nu)*masx;
     y1:=y-l*sin(nu)*masy;
     xrrr:=round(x1);
     yrrr:=round(y1);
     if res=1 then
      line(round(x+dx),round(y-dy),xrrr,yrrr);
     if res=0 then
      line(round(x+dx),round(y-dy),round(x1-dx),round(y1+dy));
     canvas.pen.color:=j;
    end;

  procedure TMexanic.lll(x,y,l,d,a:integer);
  {╨шёєхЄ ёЄЁхыъє}
  var r0:double;
      i:integer;
   begin
    for i:=-1 to 1 do
     if i<>0 then
     begin
      r0:=degtorad(d+i*a);
      line(x,y,x-round(l*cos(r0)),y+round(l*sin(r0)));
     end;
    end;

 procedure TMexanic.ras_line(x1,y1,x2,y2:integer; st:string; dn:integer);
 var xc,yc,l:integer;
     a,b,r:double;
 begin
 line(x1,y1,x2,y2);
 xc:=(x1+x2) div 2;
 yc:=(y1+y2) div 2;
 a:=arctan2(y2-y1,x2-x1);
 l:=round(radtodeg(-a));
 lll(x1,y1,8,l+180,15);
 lll(x2,y2,8,l,15);
 xc:=xc-round(3*cos(a));
 yc:=yc-round(3*sin(a));
 r:=hypot(xc-x1,yc-y1);
 b:=arctan2(dn,r);
 r:=hypot(dn,r);
 xc:=x1+round(r*cos(a+b));
 yc:=y1+round(r*sin(a+b));
 canvas.TextOut(xc,yc,st);
 end;

  procedure TMexanic.sistcoord(x0,y0,f,l1,l2:integer; co:tcolor);
   {╨шёєхЄ ёшёЄхьє ъююЁфшэрЄ}
   var i,x1,y1:integer;
       s,c:real;
     begin
     c:=degtorad(f);
     i:=canvas.pen.color;
     s:=sin(c);
     c:=cos(c);
     canvas.pen.color:=co;
     if l1<>0 then
     begin
     x1:=x0+round(l1*c);
     y1:=y0-round(l1*s);
     line(x0,y0,x1,y1);
     lll(x1,y1,8,f,angl_str);
     end;
     if l2<>0 then
     begin
     x1:=x0-round(l2*s);
     y1:=y0-round(l2*c);
     line(x0,y0,x1,y1);
     lll(x1,y1,8,f+90,angl_str);
     end;
      canvas.pen.Color:=i;
    end;

  procedure TMexanic.sistcoord1(x0,y0,f,l1,l2:integer; co:tcolor);
   {╨шёєхЄ ёшёЄхьє ъююЁфшэрЄ}
   var i,x1,y1:integer;
       s,c:real;
     begin
     c:=degtorad(f);
     i:=canvas.pen.color;
     s:=sin(c);
     c:=cos(c);
     canvas.pen.color:=co;
     if l1<>0 then
     begin
     x1:=x0+round(l1*c);
     y1:=y0-round(l1*s);
     line(x0,y0,x1,y1);
//     lll(x1,y1,8,f,angl_str);
     end;
     if l2<>0 then
     begin
     x1:=x0-round(l2*s);
     y1:=y0-round(l2*c);
     line(x0,y0,x1,y1);
//     lll(x1,y1,8,f+90,angl_str);
     end;
      canvas.pen.Color:=i;
    end;

   //╨шёєхЄ яюычєэ
   procedure TMexanic.Kamen(x0,y0:integer; ksi:double);
   begin
   pram(x0,y0,apol,hpol,ksi);
   end;

   //╨шёєхЄ яЁ ьюєуюы№эшъ
    procedure TMexanic.pram(x1,y1,a,b:integer; ksi:double; flag:boolean=true);
     var
      p1,p2,p3,p4:TPoint;
      s,c:double;
     begin
      s:=sin(ksi);
      c:=cos(ksi);
      if flag then
      begin
      p1.X:=x1-round(a*c/2-b*s/2);
      p1.Y:=y1+round(a*s/2+b*c/2);
      end
      else
      begin
      p1.X:=x1;
      p1.Y:=y1;
      end;
      p2.x:=p1.x+round(a*c);
      p2.y:=p1.y-round(a*s);
      p4.x:=p1.x+round(-b*s);
      p4.y:=p1.y-round(b*c);
      p3.x:=p2.x+p4.x-p1.x;
      p3.y:=p2.y+p4.y-p1.y;
      canvas.Polygon([p1,p2,p3,p4]);
    end;

     procedure dxdy(x0,y0,x1,y1,rc:integer; var dx,dy:integer); overload;
      var dr:double;
       begin
        dr:=hypot((x0-x1)/10,(y0-y1)/10)*10;
        dx:=round((X1-X0)/dr*rc);
        dy:=round((y1-y0)/dr*rc);
       end;

     procedure dxdy(x0,y0,x1,y1,rc:integer; var dx,dy:double); overload;
      var dr:double;
       begin
        dr:=hypot((x0-x1)/10,(y0-y1)/10)*10;
        dx:=(X1-X0)/dr*rc;
        dy:=(y1-y0)/dr*rc;
       end;

    procedure TMexanic.napr(P0:TPoint; x0,y0,ksi:double; l1,l2,dl:integer; zl1:boolean);
     var i,dx,dy,x1,y1,x2,y2,x,y:integer;
         s,c,dx1,dy1:double;
     begin
      x:=P0.x+round(masx*x0);
      y:=P0.y-round(masy*y0);
      c:=cos(ksi);
      s:=sin(ksi);
      x1:=x+round(l1*c);
      y1:=y-round(l1*s);
      x2:=x+round(l2*c);
      y2:=y-round(l2*s);
      dx:=round(10*sin(ksi-pi/4));
      dy:=round(10*cos(ksi-pi/4));
      dxdy(x,y,x2,y2,5,dx1,dy1);
      for i:=1 to dl div 5 do
       begin
        if zl1 then canvas.moveto(x1+round((i-1)*dx1),y1+round((i-1)*dy1))
               else canvas.moveto(x2-round((i-1)*dx1),y2-round((i-1)*dy1));
         linerel(dx,dy);
       end;
         line(x1,y1,x2,y2);
    end;

    procedure TMexanic.napr(x0,y0,ksi:double; l1,l2,dl:integer; zl1:boolean);
    begin
     napr(point(X000,Y000),x0,y0,ksi,l1,l2,dl,zl1);
    end;

procedure TMexanic.linerel(dx, dy: integer);
begin
canvas.LineTo(canvas.PenPos.X+dx,canvas.PenPos.y+dy);
end;


    procedure TMexanic.polzun(alf:double; x0,y0,a,h:integer);
      var x1,y1,dx2,dy2,dx1,dy1:integer;
      sc:TColor;
       begin
        x1:=round(x0-a*cos(alf)+h*sin(alf));
        y1:=round(y0+(h*cos(alf)+a*sin(alf)));
       dx2:=round(2*a*cos(alf));
        dy2:=-round(2*a*sin(alf));
         dx1:=-round(2*h*sin(alf));
        dy1:=-round(2*h*cos(alf));
        sc:=canvas.Pen.Color;
        canvas.Pen.Color:=cfona;
        canvas.Pen.Width:=3;
        line(x0-dx2 div 2,y0-dy2 div 2,x0+dx2 div 2,y0+dy2 div 2);
        canvas.Pen.Width:=1;
        canvas.Pen.Color:=sc;
        canvas.moveto(x1,y1);
        linerel(dx2,dy2);
        linerel(dx1,dy1);
        linerel(-dx2,-dy2);
        linerel(-dx1,-dy1);
    {    setfillstyle(1,cf);
        floodfill(x0,y0,getcolor);}
      end;


 procedure TMexanic.rism1(xo,yo,xa,ya:double; tet:integer);
     const alfa=40;
     var
      r:double;
      dx,dy,x0,y0,x1,y1,x2,y2,x3,y3:integer;
       begin
        x0:=x000+round(xo*masx);
        y0:=y000-round(yo*masy);
        circle(x0,y0,FRadius);
        if (xo<>xa) or (yo<>ya) then
         begin
          x1:=x000+round(masx*xa);
          y1:=y000-round(masy*ya);
          dxdy(x0,y0,x1,y1,FRadius,dx,dy);
          line(x0+dx,y0+dy,x1-dx,y1-dy);
         end;
         r:=degtorad(tet-alfa);
         x2:=x0+round(3*FRadius*cos(r));
         y2:=y0-round(3*FRadius*sin(r));
         r:=degtorad(tet+alfa);
         x3:=x0+round(3*FRadius*cos(r));
         y3:=y0-round(3*FRadius*sin(r));
          dxdy(x0,y0,x2,y2,FRadius,dx,dy);
          line(x0+dx,y0+dy,x2,y2);
          dxdy(x0,y0,x3,y3,FRadius,dx,dy);
          line(x0+dx,y0+dy,x3,y3);
          canvas.Pen.Width:=3;
          line(x2,y2,x3,y3);
          canvas.Pen.Width:=1;
        end;

    procedure TMexanic.rism1u(p0,p1:Tpoint; tet:integer=270);
    begin
     rism1u(p0.x,p0.y,p1.x,p1.y,tet);
    end;

    procedure TMexanic.rism1u(x0,y0,x1,y1:integer; tet:integer=270);
     const alfa=40;
     var
      r:double;
      dx,dy,x2,y2,x3,y3:integer;
      rcap:integer;
       begin
       line(x0,y0,x1,y1);
       rcap:=FRadius;
        circle(x0,y0,rcap);
         r:=degtorad(tet-alfa);
         x2:=x0+round(3*rcap*cos(r));
         y2:=y0-round(3*rcap*sin(r));
         r:=degtorad(tet+alfa);
         x3:=x0+round(3*rcap*cos(r));
         y3:=y0-round(3*rcap*sin(r));
          dxdy(x0,y0,x2,y2,rcap,dx,dy);
          line(x0+dx,y0+dy,x2,y2);
          dxdy(x0,y0,x3,y3,rcap,dx,dy);
          line(x0+dx,y0+dy,x3,y3);
          canvas.Pen.Width:=3;
          line(x2,y2,x3,y3);
          canvas.Pen.Width:=1;
        end;

    procedure TMexanic.stoica(p0:TPoint; tet:integer=270);
    begin
     stoica(p0.X,p0.Y,tet);
    end;

    procedure TMexanic.stoica(x0,y0:integer; tet:integer=270);
     const alfa=40;
     var
      r:double;
      dx,dy,x2,y2,x3,y3:integer;
      rcap:integer;
       begin
       rcap:=FRadius;
//        circle(x0,y0,rcap);
         r:=degtorad(tet-alfa);
         x2:=x0+round(3*rcap*cos(r));
         y2:=y0-round(3*rcap*sin(r));
         r:=degtorad(tet+alfa);
         x3:=x0+round(3*rcap*cos(r));
         y3:=y0-round(3*rcap*sin(r));
          dxdy(x0,y0,x2,y2,rcap,dx,dy);
          line(x0+dx,y0+dy,x2,y2);
          dxdy(x0,y0,x3,y3,rcap,dx,dy);
          line(x0+dx,y0+dy,x3,y3);
          canvas.Pen.Width:=3;
          line(x2,y2,x3,y3);
          canvas.Pen.Width:=1;
        end;

    procedure TMexanic.risg1(xm,ym,xn,yn,li,fi:double);
     var dx,dy,x1,y1,x2,y2,x3,y3:integer;
         rcap:integer;
     begin
      rcap:=FRadius;
      x1:=x000+round(masx*xm);
      y1:=y000-round(masy*ym);
      xx1:=x1; yy1:=y1;
      circle(x1,y1,rcap);
      x2:=x1+round(li*masx*cos(fi));
      y2:=y1-round(li*masy*sin(fi));
      xx2:=x2; yy2:=y2;
      dxdy(x1,y1,x2,y2,rcap,dx,dy);
      line(x1+dx,y1+dy,x2-dx,y2-dy);
      circle(x2,y2,rcap);
      x3:=x000+round(masx*xn);
      y3:=y000-round(masy*yn);
      xx3:=x3; yy3:=y3;
       dxdy(x2,y2,x3,y3,rcap,dx,dy);
      line(x2+dx,y2+dy,x3-dx,y3-dy);
      circle(x3,y3,rcap);
     end;

    procedure TMexanic.ris4w(xa,ya,xd,yd,a,alf,c,gam:double);
     var dx,dy,x1,y1,x2,y2,x3,y3,x4,y4:integer;
         rcap:integer;
     begin
     rcap:=FRadius;
      x1:=x000+round(masx*xa);
      y1:=y000-round(masy*ya);
      xx1:=x1; yy1:=y1;
      circle(x1,y1,rcap);
      x2:=x1+round(a*masx*cos(alf));
      y2:=y1-round(a*masy*sin(alf));
      xx2:=x2; yy2:=y2;
      dxdy(x1,y1,x2,y2,rcap,dx,dy);
      line(x1+dx,y1+dy,x2-dx,y2-dy);
      circle(x2,y2,rcap);
      x3:=x000+round(masx*(xd+c*cos(gam)));
      y3:=y000-round(masy*(yd+c*sin(gam)));
      xx3:=x3; yy3:=y3;
       dxdy(x2,y2,x3,y3,rcap,dx,dy);
      line(x2+dx,y2+dy,x3-dx,y3-dy);
      circle(x3,y3,rcap);
      x4:=x000+round(masx*xd);
      y4:=y000-round(masy*yd);
      xx4:=x4; yy4:=y4;
       dxdy(x3,y3,x4,y4,rcap,dx,dy);
      line(x3+dx,y3+dy,x4-dx,y4-dy);
      circle(x4,y4,rcap);
     end;

      procedure TMexanic.risg1u(x1,y1,x2,y2,x3,y3:integer);
     var dx,dy:integer;
         rcap:integer;
     begin
      rcap:=FRadius;
      circle(x1,y1,rcap);
      dxdy(x1,y1,x2,y2,rcap,dx,dy);
      line(x1+dx,y1+dy,x2-dx,y2-dy);
      circle(x2,y2,rcap);
       if x3>0 then
       begin
       dxdy(x2,y2,x3,y3,rcap,dx,dy);
      line(x2+dx,y2+dy,x3-dx,y3-dy);
      circle(x3,y3,rcap);
      end;
     end;

    procedure TMexanic.risg2(xm,ym,xf,yf,psi,li,fi2,xn2:double);
     var dx,dy,x1,y1,x2,y2,x3,y3,dx1,dy1:integer;
         s,c,xn,yn:double;
         rcap:integer;
     begin
      rcap:=FRadius;
      x1:=x000+round(masx*xm);
      y1:=y000-round(masy*ym);
      xx1:=x1; yy1:=y1;
      circle(x1,y1,rcap);
      x2:=x1+round(li*masx*cos(fi2+psi));
      y2:=y1-round(li*masy*sin(fi2+psi));
      xx2:=x2; yy2:=y2;
      dxdy(x1,y1,x2,y2,rcap,dx,dy);
      s:=sin(psi); c:=cos(psi);
      xn:=xf*s*s+(xn2-yf*s)*c;
      yn:=yf*c*c+(xn2-xf*c)*s;
      x3:=x000+round(masx*xn);
      y3:=y000-round(masy*yn);
      xx3:=x3; yy3:=y3;
      polzun(psi,x3,y3,apol,hpol);
       line(x1+dx,y1+dy,x2-dx,y2-dy);
       if (abs(x2-x3)>1) or (abs(y2-y3)>1) then
       begin
       dxdy(x2,y2,x3,y3,hpol,dx1,dy1);
      line(x2+dx,y2+dy,x3-dx1,y3-dy1);
      end;
           circle(x2,y2,rcap);
     end;

    procedure TMexanic.risg2u(x1,y1,x2,y2,x3,y3:integer; psi:double);
     var dx,dy,dx1,dy1:integer;
         rcap:integer;
     begin
      rcap:=FRadius;
      circle(x1,y1,rcap);
      polzun(psi,x3,y3,apol,hpol);
       dxdy(x1,y1,x2,y2,rcap,dx,dy);
       line(x1+dx,y1+dy,x2-dx,y2-dy);
       if (x2<>x3) or (y2<>y3) then
       begin
       dxdy(x2,y2,x3,y3,hpol,dx1,dy1);
      line(x2+dx,y2+dy,x3-dx1,y3-dy1);
      end;
      circle(x2,y2,rcap);
     end;

    procedure TMexanic.risg3(xm,ym,xn,yn,mt,fk,lk,l:double);
     var x1,y1,x2,y2,x3,y3,x4,y4,dx,dy:integer;
         r:double;
         rcap:integer;
      begin
      rcap:=FRadius;
       x1:=x000+round(masx*xm);
       y1:=y000-round(masy*ym);
       if mt>=0 then r:=pi/2 else r:=3*pi/2;
       x2:=x1+round(mt*masx*cos(fk+r));
       y2:=y1-round(mt*masy*sin(fk+r));
       x3:=x000+round(masx*xn);
       y3:=y000-round(masy*yn);
       x4:=x2+round(l*masx*cos(fk));
       y4:=y2-round(l*masy*sin(fk));
       if mt<>0 then
        begin
         dxdy(x1,y1,x2,y2,rcap,dx,dy);
         line(x1+dx,y1+dy,x2,y2);
         dxdy(x2,y2,x3,y3,apol,dx,dy);
         line(x2,y2,x3-dx,y3-dy);
        end
        else
         begin
          dxdy(x1,y1,x3,y3,apol,dx,dy);
          circle(x1,y1,rcap);
          line(x1+round(dx*rcap/apol),y1+round(dy*rcap/apol),x3-dx,y3-dy);
         end;
         line(x3+dx,y3+dy,x4,y4);
         polzun(fk,x3,y3,apol,hpol);
         circle(x3,y3,rcap);
    end;

{-------------------------------------------------------------------}
  procedure dx_dy(rrr,xi,yi,xj,yj:integer; var dx,dy:integer);
   var d:double;
       r1,r2:integer;
    begin
     r1:=xj-xi;
     r2:=yj-yi;
     d:=hypot(r1,r2);
       if round(d)<=rrr then
      begin dx:=0; dy:=0 end
      else
       begin
       dx:=round(r1*rrr/d); dy:=round(r2*rrr/d);
       end
    end;
{-------------------------------------------------------------------}
{    procedure TMexanic.kpect(x0,y0,cwet:integer);
     var i:integer;
      begin
       for i:=-2 to 2 do
       putpixel(x0+i,y0,cwet);
       for i:=-2 to 2 do
       putpixel(x0,y0+i,cwet);
      end;  }
{-------------------------------------------------------------------}
  procedure TMexanic.mex0(xi,yi,xj,yj:integer);
   var dx,dy:integer;
       rcap:integer;
    begin
      rcap:=FRadius;
     dx_dy(rcap,xi,yi,xj,yj,dx,dy);
     if (dx<>0) or (dy<>0) then
      line(xi+dx,yi+dy,xj-dx,yj-dy);
    end;

{-------------------------------------------------------------------}
  procedure TMexanic.mex1(xi,yi,xj,yj:integer);
   var dx,dy:integer;
       rcap:integer;
    begin
      rcap:=FRadius;
      circle(xi,yi,rcap);
     dx_dy(rcap,xi,yi,xj,yj,dx,dy);
     if (dx<>0) or (dy<>0) then
      line(xi+dx,yi+dy,xj-dx,yj-dy);
    end;

{-------------------------------------------------------------------}
   procedure TMexanic.mex1s(xi,yi,xj,yj,alf:integer);
    var x,y,x1,y1:integer;
        rcap:integer;
     begin
      rcap:=FRadius;
      mex1(xi,yi,xj,yj);
      prxy(rcap,alf-45,x,y);
      canvas.moveto(x+xi,yi+y);
      prxy(2*rcap,alf-45,x1,y1);
      linerel(x1,y1);
      x1:=canvas.penpos.x;
      y1:=canvas.penpos.y;
      prxy(rcap,alf+45,x,y);
      canvas.moveto(x+xi,yi+y);
      prxy(2*rcap,alf+45,x,y);
      linerel(x,y);
      canvas.pen.width:=3;
      canvas.lineto(x1,y1);
      canvas.pen.width:=1;
     end;

{-------------------------------------------------------------------}
   procedure TMexanic.hedww(xi,yi,xj,yj:integer);
   var dx,dy:integer;
       rcap:integer;
    begin
    rcap:=FRadius;
    circle(xi,yi,rcap);
     dx_dy(rcap,xi,yi,xj,yj,dx,dy);
     if (dx<>0) or (dy<>0) then
      begin line(xi+dx,yi+dy,xj-dx,yj-dy);
      circle(xj,yj,rcap);
      end;
     end;

  procedure TMexanic.polz(xi,yi,alf:integer);
   var
    r,r1:real;
    dx1,dy1,dx2,dy2:integer;
    x,y:array[1..4] of integer;
    c:TColor;
    procedure p4;
     var i:byte;
     begin
      canvas.moveto(x[1],y[1]);
      for i:=2 to 4 do
       canvas.lineto(x[i],y[i]);
      canvas.lineto(x[1],y[1]);
     end;
    begin
     r:=degtorad(alf);
     r1:=cos(r);
     r:=sin(r);
     x[1]:=xi-round((apol*r1-hpol*r)/2);
     y[1]:=yi+round((apol*r+hpol*r1)/2);
     prxy(apol,alf,dx1,dy1);
     prxy(hpol,alf+90,dx2,dy2);
     x[2]:=x[1]+dx1;
     y[2]:=y[1]+round(dy1);
     x[3]:=x[2]+dx2;
     y[3]:=y[2]+round(dy2);
     x[4]:=x[1]+dx2;
     y[4]:=y[1]+round(dy2);
     c:=canvas.Pen.Color;
   //  canvas.Pen.Color:=clblack;
//     setcolor(0);
     p4;
     canvas.Brush.Style:=bsclear;
     canvas.Brush.color:=cwpolz;
     //setfillstyle(tbrushstyle(0),cwpolz);
     canvas.floodfill(xi,yi,c,fsborder);
     canvas.Pen.Color:=c;
     // setcolor(c);
     exit;
     p4;
     canvas.Brush.Style:=bssolid;
//     setfillstyle(tbrushstyle(1),cwpolz);
     canvas.floodfill(xi,yi,c,fsborder);
   end;

     procedure TMexanic.hedwp(xi,yi,xj,yj,alf:integer);
      var dx,dy:integer;
          rcap:integer;
      begin
       rcap:=FRadius;
       if rej<>0 then circle(xi,yi,rcap);
       dx_dy(rcap,xi,yi,xj,yj,dx,dy);
       if (dx<>0) or (dy<>0) then
        begin
         line(xi+dx,yi+dy,xj,yj);
         if alf>=0 then polz(xj,yj,alf);
        end;
       end;
{-------------------------------------------------------------------}
     procedure TMexanic.hedpp(xi,yi,xj,yj,alf,bet:integer);
      var dx,dy:integer;
      begin
       if rej<>0 then polz(xi,yi,alf);
       dx_dy(hpol div 2,xi,yi,xj,yj,dx,dy);
       if (dx<>0) or (dy<>0) then
        begin
         line(xi,yi,xj,yj);
         polz(xi,yi,alf);
         if bet>=0 then polz(xj,yj,bet);
        end;
       end;


function TMexanic.lfiToPoint(p0: TPoint; l, fi: double): Tpoint;
var r:double;
begin
 if masx<=0 then r:=1 else r:=masx;
 result.X:=p0.X+round(l*cos(fi)*r);
 result.y:=p0.y-round(l*sin(fi)*r);
end;

procedure TMexanic.PointToLFi(p1, p2: TPoint; var l, fi: double);
var r:double;
begin
 if masx<=0 then r:=1 else r:=masx;
 l:=hypot(p2.X-p1.X,p2.Y-p1.Y)/r;
 fi:=arctan2(p1.Y-p2.Y,p2.x-p1.X);
end;

function TMexanic.lfiToPoint_1(p0: TPoint; l, fi: double): Tpoint;
begin
 result.X:=p0.X+round(l*cos(fi));
 result.y:=p0.y-round(l*sin(fi));
end;

procedure TMexanic.PointToLFi_1(p1, p2: TPoint; var l, fi: double);
begin
 l:=hypot(p2.X-p1.X,p2.Y-p1.Y);
 fi:=arctan2(p1.Y-p2.Y,p2.x-p1.X);
end;
{---------------------------------------------------------------------}

   function TMexanic.xint(p0:Tpoint; x:double):integer;
    begin
     xint:=P0.x+round(x*masx);
     end;
   function TMexanic.yint(p0:Tpoint; y:double):integer;
    begin
     yint:=P0.y-round(y*masy);
     end;
   function TMexanic.xint(x:double):integer;
   begin
    result:=xint(Point(X000,Y000),x);
   end;
   function TMexanic.yint(y:double):integer;
   begin
    result:=yint(Point(X000,Y000),y);
   end;
end.
{--------------------------------------------------------------------}
     procedure TMexanic.mex2(xi,yi,xj,yj,alf:integer);
      var dx,dy:integer;
      begin
       if rej<>0 then polz(xi,yi,alf);
       dx_dy(rcap,xi,yi,xj,yj,dx,dy);
       if (dx<>0) or (dy<>0) then
        begin
         line(xi,yi,xj-dx,yj-dy);
         polz(xi,yi,alf);
        end;
       end;
{-------------------------------------------------------------------}
      procedure TMexanic.mex2s(xi,yi,xj,yj,alf:integer);
      var dx,dy,dx1,dy1,i,x1,y1:integer;
       begin
        prxy(2*apol,alf,dx,dy);
        x1:=xi-dx; y1:=yi-dy;
        line(x1,y1,xi+dx,yi+dy);
        prxy(6,alf+45,dx1,dy1);
      with obj_image do
        for i:=0 to 5 do
        begin
         moveto(x1+round(2*dx/apol)*i,y1+round(2*dy/apol)*i);
         linerel(-dx1,-dy1);
        end;
        mex2(xi,yi,xj,yj,alf);
       end;
{---------------------------------------------------------------------}

   function TMexanic.xint(x:double):integer;
    begin
     xint:=x000+round(x*masx);
     end;
   function TMexanic.yint(y:double):integer;
    begin
     yint:=y000-round(y*masy);
     end;
{-------------------------------------------------------------------}
    procedure TMexanic.rcze1(x0,y0,cw:integer; a,alf,bet,l:double);
     var r,rx,ry,dx,dy,rx1,ry1:double;
         i,x1,y1,x,y,cx,cy,cc:integer;
      begin
       x1:=x000; y1:=y000; cc:=getcolor;
       x000:=x0; y000:=y0; setcolor(cw);
       r:=alf*pi/180; ry:=cos(r); rx:=sin(r);
       dx:=abs(a)*rx; dy:=abs(a)*ry;
       if a>0 then
        begin cx:=0; cy:=0 end
        else
         begin
          cx:=round(l*rx/2);
          cy:=round(l*ry/2)
         end;
        i:=1; r:=4/masx;
        while i>=-1 do
         begin
          x:=xint(i*dx); y:=yint(i*dy);
          line(x0+i*cx,y0-i*cy,x,y);
          rx1:=(alf+i*bet)*pi/180; ry1:=cos(rx1); rx1:=sin(rx1);
          line(x,y,xint(i*dx-r*ry1),yint(i*dy+r*rx1));
          line(x,y,xint(i*dx+r*ry1),yint(i*dy-r*rx1));
          i:=i-2;
         end;
        if a>0 then line(x0,y0,xint(-l*ry),yint(l*rx));
         x000:=x1; y000:=y1; setcolor(cc);
    end;
{-------------------------------------------------------------------}
    procedure TMexanic.rczi1(x0,y0,cw:integer; a,alf,bet,l,b:double);
     const r0=6; c=12;
     var r,rx,ry,dx,dy,a1,r1,al,rx1,ry1:double;
         i,x1,y1,x2,y2,cx,cy,cc,xx,yy,an,xs,ys:integer;
         coo:arccoordstype;
      begin
       x1:=x000; y1:=y000; cc:=getcolor;
       x000:=x0; y000:=y0; setcolor(cw);
       r:=alf*pi/180; ry:=cos(r); rx:=sin(r);
       a1:=abs(a);
       dx:=(a1+(c-r0)/masx)*rx; dy:=(a1+(c-r0)/masx)*ry;
       if a>0 then
        begin cx:=0; cy:=0 end
        else
         begin
          cx:=round(l*rx/2);
          cy:=round(l*ry/2)
         end;
        i:=1; r:=4;
        while i>=-1 do
         begin
          x2:=xint(i*dx); y2:=yint(i*dy);
          line(x0+i*cx,y0-i*cy,x2,y2);
          al:=(3-i)*45-alf;
          if al<0 then al:=al+360;
          an:=round(al);
          pas_7.arc(x2+round(r0*ry),y2+round(r0*rx),an,an+90,r0);
          getarccoords(coo);
          with coo do
           begin
            r1:=b/masx-2*r0;
            xx:=round(r1*ry);
            yy:=round(r1*rx);
            if i>0 then begin xs:=xstart; ys:=ystart end
                  else begin xs:=xend; ys:=yend end;
            line(xs,ys,xs+xx,ys+yy);
            an:=an-i*90;
            if an<0 then an:=an+360;
            pas_7.arc(x+xx,y+yy,an,an+90,r0);
            getarccoords(coo);
            if i>0 then begin xs:=xstart; ys:=ystart end
                  else begin xs:=xend; ys:=yend end;
            xx:=xs-i*round((c-r0)*rx);
            yy:=ys+i*round((c-r0)*ry);
            line(xs,ys,xx,yy);
           end;
          rx1:=degtorad(alf+i*bet); ry1:=cos(rx1); rx1:=sin(rx1);
          line(xx,yy,xx-round(r*ry1),yy+round(r*rx1));
          line(xx,yy,xx+round(r*ry1),yy-round(r*rx1));
          i:=i-2;
         end;
        if a>0 then line(x0,y0,xint(-l*ry),yint(l*rx));
         x000:=x1; y000:=y1; setcolor(cc);
    end;
{-------------------------------------------------------------------}
  procedure TMexanic.corito(x0,y0,cw,cz:integer; a,b,alf:double);
   var rx,ry,r1,r2:double;
       x,y,x1,y1,cc:integer;
     begin
      ry:=degtorad(alf);
      rx:=cos(ry); ry:=sin(ry);
      x:=x000; y:=y000; cc:=getcolor;
      x000:=x0; y000:=y0; setcolor(cw);
      x1:=getx; y1:=gety;
   with obj_image do
     begin
      moveto(x0,y0);
      lineto(xint(a*rx),yint(a*ry));
      r1:=a*rx-b*ry; r2:=a*ry+b*rx;
      lineto(xint(r1),yint(r2));
      if cz<0 then moveto(xint(-b*ry),yint(b*rx))
              else lineto(xint(-b*ry),yint(b*rx));
      lineto(x0,y0); moveto(x1,y1);
     end;
      if cz>=0 then
       begin
        setfillstyle(tbrushstyle(12),cz);
       // setfillpattern(stiltype,cz);
        x1:=xint(r1/2); y1:=yint(r2/2);
        setcolor(getpixel(x1,y1));
        floodfill(x1,y1,cw);
        line(xint(r1),yint(r2),xint(-b*ry),yint(b*rx));
       end;
      setcolor(cc); x000:=x; y000:=y;
  end;
{-----------------------------------------------------------------}
  procedure TMexanic.corito1(x0,y0,cw,cz:integer; a,b,c,alf:double);
   var rx,ry,r1,r2,r3,r4,r5,r6,r:double;
       x,y,x1,y1,x2,y2,cc:integer;
     begin
      ry:=degtorad(alf);
      rx:=cos(ry); ry:=sin(ry);
      x:=x000; y:=y000; cc:=getcolor;
      x000:=x0; y000:=y0; setcolor(cw);
      x2:=getx; y2:=gety;
      with obj_image do
      begin
      moveto(x0,y0);
      lineto(xint(a*rx),yint(a*ry));
      r1:=a*rx-b*ry; r2:=a*ry+b*rx;
      lineto(xint(r1),yint(r2));
      r:=a-abs(b);
      r3:=r1-r*rx; r4:=r2-r*ry;
      lineto(xint(r3),yint(r4));
       x1:=xint(r3/2); y1:=yint(r4/2);
       r:=abs(b);
      r5:=-c*ry+r*rx; r6:=c*rx+r*ry;
       lineto(xint(r5),yint(r6));
      lineto(xint(-c*ry),yint(c*rx));
      lineto(x0,y0);
        setfillstyle(12,cz);
       // setfillpattern(stiltype,cz);
        setcolor(getpixel(x1,y1));
        pas_7.floodfill(x1,y1,cw);
      moveto(xint(r1),yint(r2));
      lineto(xint(r3),yint(r4));
       lineto(xint(r5),yint(r6));
      lineto(xint(-c*ry),yint(c*rx));
       moveto(x2,y2);
      end;
      setcolor(cc); x000:=x; y000:=y;
  end;
{-----------------------------------------------------------------}

  procedure TMexanic.strix(x0,y0,cw,cz:integer; a,b,alf:double);
   var rx,ry,r1,r2:double;
       x,y,x1,y1,cc,i,x2,y2:integer;
     begin
      ry:=degtorad(alf);
      rx:=cos(ry); ry:=sin(ry);
      x:=x000; y:=y000; cc:=getcolor;
      x000:=x0; y000:=y0; setcolor(cw);
      x1:=getx; y1:=gety;
   with obj_image do
    begin
      moveto(x0,y0);
      for i:=0 to 1 do
      begin
      lineto(xint(a*rx),yint(a*ry));
      r1:=a*rx-b*ry; r2:=a*ry+b*rx;
      lineto(xint(r1),yint(r2));
      lineto(xint(-b*ry),yint(b*rx));
      lineto(x0,y0);
      if i=0 then
       begin
        setfillstyle(12,cz);
        //setfillpattern(stiltype,cz);
        x2:=xint(r1/2); y2:=yint(r2/2);
        setcolor(getpixel(x2,y2));
        pas_7.floodfill(x2,y2,cw);
       end;
      end;
        moveto(x1,y1);
    end;
      setcolor(cc); x000:=x; y000:=y;
  end;
{-----------------------------------------------------------------}

  procedure TMexanic.oporaz(x0,y0,cw,cz:integer; a,b,c,d,alf:double);
   var i:byte;
       dx,dy,cc:integer;
       d1,rx,ry:double;
    begin
     ry:=degtorad(alf);
     rx:=cos(ry); ry:=sin(ry);
     d1:=abs(d);
     cc:=getcolor; setcolor(cw);
     dx:=round(d1*ry/2); dy:=round(d1*rx/2);
     if b=c then
      begin
       corito(x0-dx,y0-dy,cw,cz,a,b,alf);
       corito(x0+dx,y0+dy,cw,cz,a,-b,alf);
     end
     else
      begin
       corito1(x0-dx,y0-dy,cw,cz,a,b,c,alf);
       corito1(x0+dx,y0+dy,cw,cz,a,-b,-c,alf);
      end;
     if d<0 then
      for i:=0 to 1 do
        begin
         if i=0 then
          begin
           dx:=x0-round(3*rx); dy:=y0+round(3*ry);
          end
         else
          begin
           dx:=x0+round((3+a)*rx); dy:=y0-round((3+a)*ry);
          end;
         line(dx,dy,dx-round(4*ry),dy-round(4*rx));
         line(dx,dy,dx+round(4*ry),dy+round(4*rx));
        end;
        setcolor(cc);
    end;
 {--------------------------------------------------------------------}
  procedure TMexanic.wodilo(x0,y0,cw:integer; a,b,c,alf:double);
   var rx,ry:double;
       x,y,cc:integer;
     begin
      ry:=degtorad(alf);
      rx:=cos(ry); ry:=sin(ry);
      x:=x000; y:=y000; cc:=getcolor;
      x000:=x0; y000:=y0; setcolor(cw);
      line(x0,y0,xint(a*ry),yint(a*rx));
      line(x0,y0,xint(b*rx),yint(-b*ry));
      if c<>0 then line(xint(a*ry),yint(a*rx),xint(a*ry-c*rx),yint(a*rx+c*ry));
      x000:=x; y000:=y; setcolor(cc);
    end;
 {-----------------------------------------------------------------------}
    procedure TMexanic.djeims1(x0,y0,cw,cz1,z1,z2:integer; a,m:double);
     const o1=18; o2=10;
     var r:double;
         rz,h,cz,z3,i:integer;
     begin
      z3:=z1+2*z2;
      if cz1<0 then i:=-1 else i:=1;
      h:=round(0.2*m*z3);
      cz:=abs(cz1);
      rz:=z1+z2;
      r:=m*rz/2;
      rz:=round(r);
      rcze1(x0,y0,cw,m*z1/2,a,0,-(15+tmmo1)*i);
      oporaz(x0+10*i-((1-i) div 2)*tmmo1,y0,cw,cz,tmmo1,8,8,-tmmd,-a);
      rcze1(x0,y0-rz,cw,-m*z2/2,a,0,8);
      oporaz(x0-tmmo2 div 2,y0-rz,cw,-cz,tmmo2,4,4,-tmmd,-a);
      wodilo(x0-(h div 2)*i,y0,cw,r,-(h div 2+tmmo1+6)*i,-((h+tmmo2) div 2+4)*i,a);
      oporaz(x0-i*h,y0,cw,cz,tmmo1,8,tmmc,-tmmd,-a+(1+i)*90);
      rczi1(x0-i*h,y0,cw,-m*z3/2,a+(1-i)*90,0,tmmd,h);
     end;
 {------------------------------------------------------------------------}
    procedure TMexanic.djeims2(x0,y0,cw,cz1,z1,z2,z21:integer; a,m:double);
     var r:double;
         rz,h,cz,z3,i:integer;
     begin
      z3:=z1+z2+z21;
      if cz1<0 then i:=-1 else i:=1;
      h:=round(0.1*m*z3);
      cz:=abs(cz1);
      rz:=z1+z2;
      r:=m*rz/2;
      rz:=round(r);
      rcze1(x0,y0,cw,m*z1/2,a,0,-(15+tmmo1)*i);
      oporaz(x0+10*i-((1-i) div 2)*tmmo1,y0,cw,cz,tmmo1,8,8,-tmmd,-a);
      rcze1(x0,y0-rz,cw,m*z2/2,a,0,i*h);
      rcze1(x0-2*h*i,y0-rz,cw,m*z21/2,a,0,-i*h);
      oporaz(x0-tmmo2 div 2-i*h,y0-rz,cw,-cz,tmmo2,4,4,-tmmd,-a);
      wodilo(x0-h*i,y0,cw,r-tmmd div 2,-(2*h+tmmo1+6)*i,0,a);
      oporaz(x0-3*i*h,y0,cw,cz,tmmo1,8,tmmc,-tmmd,-a+(1+i)*90);
      rczi1(x0-3*i*h,y0,cw,-m*z3/2,a+(1-i)*90,0,tmmd,h);
     end;
 {------------------------------------------------------------------------}
    procedure TMexanic.djeims3(x0,y0,cw,cz1,z1,z2,z21:integer; a,m:double);
     var r:double;
         rz,h,cz,z3,i:integer;
     begin
      z3:=z1+z2-z21;
      if cz1<0 then i:=-1 else i:=1;
      h:=round(0.1*m*(z3+2*z21));
      cz:=abs(cz1);
      rz:=z1+z2;
      r:=m*rz/2;
      rz:=round(r);
      rcze1(x0,y0,cw,m*z1/2,a,0,-(15+tmmo1)*i);
      oporaz(x0+10*i-((1-i) div 2)*tmmo1,y0,cw,cz,tmmo1,8,8,-tmmd,-a);
      rcze1(x0,y0-rz,cw,m*z2/2,a,0,i*h);
      rcze1(x0-2*h*i,y0-rz,cw,m*z21/2,a,0,-i*h);
      oporaz(x0-tmmo2 div 2-i*h,y0-rz,cw,-cz,tmmo2,4,4,-tmmd,-a);
      wodilo(x0-h*i,y0,cw,r-tmmd div 2,-(h+tmmo1+6)*i,0,a);
      oporaz(x0-2*i*h,y0,cw,cz,tmmo1,8,tmmc,-tmmd,-a+(1+i)*90);
      rcze1(x0-2*i*h,y0,cw,-m*z3/2,a+(1-i)*90,0,tmmd);
     end;
 {------------------------------------------------------------------------}
    procedure TMexanic.djeims4(x0,y0,cw,cz1,z1,z2,z21:integer; a,m:double);
     var r:double;
         rz,h,cz,z3,i:integer;
     begin
      z3:=z1-z2+z21;
      if cz1<0 then i:=-1 else i:=1;
      h:=round(0.1*m*z3);
      cz:=abs(cz1);
      rz:=z1-z2;
      r:=m*rz/2;
      rz:=round(r);
      rczi1(x0,y0,cw,m*z1/2,a+(1+i)*90,0,15+tmmo1,h);
      oporaz(x0+10*i-((1-i) div 2)*tmmo1,y0,cw,cz,tmmo1,8,8,-tmmd,-a);
      rcze1(x0-i*h,y0-rz,cw,m*z2/2,a,0,i*h);
      rcze1(x0-3*h*i,y0-rz,cw,m*z21/2,a,0,-i*h);
      oporaz(x0-tmmo2 div 2-2*i*h,y0-rz,cw,-cz,tmmo2,4,4,-tmmd,-a);
      wodilo(x0-2*h*i,y0,cw,r-tmmd div 2,-(2*h+tmmo1+6)*i,0,a);
      oporaz(x0-4*i*h,y0,cw,cz,tmmo1,8,tmmc,-tmmd,-a+(1+i)*90);
      rczi1(x0-4*i*h,y0,cw,-m*z3/2,a+(1-i)*90,0,tmmd,h);
     end;
     procedure TMexanic.zaccol(x0,y0,cw,cz,r,dr,a1,a2:integer);
      var r1,r2:arccoordstype;
          x,y,i,cc:integer;
          c:double;
       begin
        cc:=getcolor; setcolor(cw);
        for i:=0 to 1 do
         begin
          arc(x0,y0,a1,a2,r);
          getarccoords(r1);
           arc(x0,y0,a1,a2,r+dr);
          getarccoords(r2);
          line(r1.xstart,r1.ystart,r2.xstart,r2.ystart);
           line(r1.xend,r1.yend,r2.xend,r2.yend);
           if i=0 then
            begin
             c:=(a1+a2)*pi/360;
             x:=x0+round((r+dr/2)*cos(c));
             y:=y0-round((r+dr/2)*sin(c));
             setfillstyle(12,cz);
        //     setfillpattern(stiltype,cz);
                       setcolor(getpixel(x,y));
             floodfill(x,y,cw);
          end;
         end;
        setcolor(cc);
    end;
 {------------------------------------------------------------------------}

    begin
    stetic:=0;
    rcap:=4;
    apol:=20;
    hpol:=14;
    cwpolz:=0;
   // stiltype:=stiltype1;

end.

