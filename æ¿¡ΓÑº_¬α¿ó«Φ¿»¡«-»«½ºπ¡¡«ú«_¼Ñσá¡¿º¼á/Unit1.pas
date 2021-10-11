unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, jpeg;

type
  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Image1: TImage;
    Chart1: TChart;
    Series1: TLineSeries;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit7: TEdit;
    Label14: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Chart2: TChart;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Chart3: TChart;
    Series5: TLineSeries;
    Button2: TButton;
    Edit10: TEdit;
    Label15: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Label17: TLabel;
    CheckBox1: TCheckBox;
    Button3: TButton;
    Label18: TLabel;
    Edit14: TEdit;
    Label19: TLabel;
    Image2: TImage;
    Label20: TLabel;
    Button4: TButton;
    Label21: TLabel;
    Shape1: TShape;
    Label16: TLabel;
    Label22: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Chart2GetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses math,zerofun,mexanic, Unit2, Unit3;
{$R *.dfm}

const G1R=pi/180;
var fim,Sm,K:double;
    A_:array[0..3] of double;
    mex2:TMexanic;
    PA,PB,PC,PD:Tpoint;
    Pr:Tpoint2;
    fi,psi,xi,a,b,e:double;

  procedure AxBy_C(a1,b1,c1,a2,b2,c2:double; var x,y:double);
  {Решение системы вида a1*x+b1*y=c1
                        a2*x+b2*y=c2
  }
  var d:double;
   begin
    d:=a1*b2-a2*b1;
    x:=(c1*b2-c2*b1)/d;
    y:=(c2*a1-c1*a2)/d;
   end;

function findb(b:double):double;
begin
result:=((A_[0]*b+A_[1])*b+A_[2])*b+A_[3];
end;

function Alf_TCos(a,b,c:double):double;
//c^2=a^2+b^2-2*a*b*cos(alf)
begin
result:=arccos((a*a+b*b-c*c)/2/a/b);
end;

function C2_TCos(a,b,alf:double):double;
//c^2=a^2+b^2-2*a*b*cos(alf)
begin
result:=a*a+b*b-2*a*b*cos(alf);
end;

procedure Treug(Xb_Xd,Yb_Yd,li,lj:double; var fi1,fi2,fj1,fj2:double); overload;
var gam,alf,Lbd:double;
begin
 Lbd:=hypot(Xb_Xd,Yb_Yd);
 gam:=arctan2(Yb_Yd,Xb_Xd);
 alf:=arccos((Lbd*Lbd+lj*lj-li*li)/2/lj/Lbd);
 fj1:=gam-alf;
 fj2:=gam+alf;
 alf:=arccos((Lbd*Lbd+li*li-lj*lj)/2/li/Lbd);
 gam:=gam-pi;
 fi1:=gam+alf;
 fi2:=gam-alf;
end;

procedure Treug(Xb_Xd,Yb_Yd,li,lj:double; var f:array of double); overload;
begin
Treug(Xb_Xd,Yb_Yd,li,lj,f[0],f[1],f[2],f[3]);
end;

procedure DiadaWWW_P(Xb,Yb,Xd,Yd,li,lj:double; var f:array of double);
var Xdb,Ydb,Ldb,gam,alf:double;
    i:integer;
begin
 Xdb:=Xd-Xb; Ydb:=Yd-Yb;
 Ldb:=hypot(Xdb,Ydb);
 gam:=arctan2(Ydb,Xdb);
 alf:=arccos((Ldb*Ldb+li*li-lj*lj)/2/li/Ldb);
 f[0]:=gam-alf;
 f[1]:=gam+alf;
 for i:=0 to 1 do
 f[i+2]:=arctan2(Yb+li*sin(f[i])-Yd,Xb+li*cos(f[i])-Xd);
end;

procedure rismex;
begin
 Pr:=Point2_(a,fi);  //B
 PB:=P2_Point(PA,Pr);
 Pr:=Point2(0,-e);  //D
 PD:=P2_Point(PA,Pr);
 PC:=P2_Point(PA,Point2_(Pr,xi,0));
 mex2.rism1u(pA,pB);
 mex2.napr(PA,0,-e,0,0,form1.image1.Width-PA.X,20,false);
 mex2.GRWWP(PB,PC,PC,0);
end;

procedure TForm1.Button1Click(Sender: TObject);
var x,z,Nu,r,r1,r2,r3,cz,sz,cz2:double;
    bmin,bmax:double;
    m:integer;
    dfi,mas0:double;
begin
 button3.Enabled:=false;
 button4.Enabled:=false;
 label20.Caption:='План положения синтезированного механизма на рабочем ходе';
 image2.Visible:=false;
 image1.Visible:=true;
 image1.Canvas.FillRect(rect(0,0,image1.Width,image1.Height));
 series1.Clear;
 series2.Clear;
 series3.Clear;
 series4.Clear;
 series5.Clear;
 if tag=0 then
 begin
  fim:=strtofloat(edit1.Text)*G1R;
  K:=fim/(2*pi-fim);
  edit7.Text:=floattostr(K);
 end
 else
 begin
  K:=strtofloat(edit7.Text);
  fim:=2*pi*K/(1+K);
  edit1.Text:=floattostr(fim/G1R);
 end;
 tag:=0;
 Sm:=strtofloat(edit2.Text);
  x:=Sm/2;
  z:=fim/2;
  sz:=sin(z);
  cz:=cos(z);
  cz2:=cz*cz;
  bmin:=0.001;
  bmax:=1/abs(cz);
  edit8.Text:=format('%0.4f',[bmin*x]);
  edit9.Text:=format('%0.4f',[bmax*x]);
  b:=bmin;
 while b<=bmax do
  begin
  series1.AddXY(b,sqr(b)*cz2*(sqr(b)+1)-1);
  b:=b+0.001;
  end;
 // exit;
  //решение уравнения для b
  if cz2>0 then m:=1 else m:=0;
 if m=1 then
 b:=sqrt(0.5*(sqrt(1+4/cz2)-1));
  if m=0 then
  begin
   with form3 do
   begin
  //  label6.Caption:=format('%0.1f',[(pi+psim)/2/G1R]);
  //  label7.Caption:=format('%0.1f',[(3*pi+psim)/2/G1R]);
  //  label10.Caption:=format('%0.1f',[(pi+psim)/(3*pi-psim)]);
  //  label11.Caption:=format('%0.1f',[(3*pi+psim)/(pi-psim)]);
   end;
   form3.showmodal;
   exit;
  end;
  a:=sqrt(1-b*b*cz2)/sz;
  e:=abs((b*b-1)*cz/sz);
  nu:=arcsin((a+abs(e))/b);
  edit3.Text:=format('%0.4f',[a*x]);
  edit4.Text:=format('%0.4f',[nu/G1R]);
  edit5.Text:=format('%0.4f',[b*x]);
  edit6.Text:=format('%0.4f',[e*x]);
  r1:=sqrt(sqr(b-a)-e*e);
  r2:=sqrt(sqr(b+a)-e*e);
  edit12.Text:=format('%0.4f',[r2*x]);
  edit13.Text:=format('%0.4f',[r1*x]);
  r1:=pi-arcsin(e/(b-a));
  r2:=2*pi-arcsin(e/(b+a));
  edit10.Text:=format('%0.4f',[r2/G1R]);
  edit11.Text:=format('%0.4f',[r1/G1R]);
  k:=round((r2-r1)/0.2);
  dfi:=(r2-r1)/k;
  fi:=r1;
  m:=0;
  mas0:=masx;
  sz:=e*masx/y000;
  if sz>1 then mex2.masxy(masx/(1.07*sz));
  sz:=a*masx/x000;
  if sz>1 then mex2.masxy(masx/(1.07*sz));
  while fi<=r2+dfi/2 do
  begin
   inc(m);
   sz:=sin(fi); cz:=cos(fi);
   psi:=pi-arcsin((e+a*sz)/b);
   r:=sin(psi); cz2:=cos(psi);
   xi:=a*cz-b*cz2; //s
   series2.AddXY(fi,xi*x);
   r3:=a*cz/b/cz2;  //psi`
   z:=b*r*r3-a*sz;
   series3.AddXY(fi,z*x);
   r3:=r3*r3;
   z:=(b*r*r3-a*sz)/b/cz2; //psi``
   z:=b*cz2*r3+b*r*z-a*cz;
   series4.AddXY(fi,z*x);

   r:=arcsin((e+a*sz)/b);
   series5.AddXY(fi,r/G1R);
   with form2.StringGrid1 do
   begin
    cells[0,m]:=inttostr(m);
    cells[1,m]:=format('%0.4f',[fi/G1R]);
    cells[2,m]:=format('%0.4f',[xi*x]);
    cells[3,m]:=format('%0.4f',[r/G1R]);
    cells[4,m]:=format('%0.4f',[psi/G1R]);
   end;
   if checkbox1.Checked then
   mex2.Canvas.Pen.Color:=RGB(random(255),random(255),random(255))
   else
   mex2.Canvas.Pen.Color:=clblack;
   rismex;
   fi:=fi+dfi;
  end;
  masx:=mas0;
  masy:=mas0;
  form2.StringGrid1.RowCount:=m+2;
 button3.Enabled:=true;
 button4.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 mex2:=TMexanic.Create;
 mex2.SetCanvas(image1.Canvas);
 mex2.masxy(85.0);
 x000:=90;
 y000:=150;
 PA.X:=x000;
 PA.Y:=y000;
 decimalseparator:='.';
 fim:=strtofloat(edit1.Text)*pi/180;
 Sm:=strtofloat(edit2.Text);
 K:=fim/(2*pi-fim);
 edit7.Text:=floattostr(K);
 label15.Caption:=#163+'  j  '+#163;
 label16.Caption:=#163+'      '+#163;
 //image2.Picture.LoadFromFile('1.bmp');
 label20.Caption:='Исходная схема кривошипно-ползунного механизма';
end;

procedure TForm1.Chart2GetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
begin
 case index of
 0:legendtext:='V(j)';
 1:legendtext:='V'+#162+'(j)';
 2:legendtext:='V'+#178+'(j)';
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if tag=2 then exit;
button1Click(self);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 form2.show;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if (sender as TEdit).Name='Edit1' then
tag:=0 else
tag:=1;
case key of
'0'..'9','.',#8:exit;
else key:=#0;
end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
 image1.Visible:=false;
 image2.Visible:=true;
 label20.Caption:='Исходная схема механизма шарнирного четырехзвенника';
end;

procedure TForm1.Button4Click(Sender: TObject);
const n=48;
var
    dfi,r,sz,cz,cz2:double;
begin
 tag:=2;
 image2.Visible:=false;
 image1.Visible:=true;
 label20.Caption:='Движение кривошипно-ползунного механизма';
 image1.Canvas.FillRect(rect(0,0,image1.Width,image1.Height));
 fi:=0;
 dfi:=2*pi/n;
  while fi<=2*pi+dfi/2 do
  begin
   sz:=sin(fi); cz:=cos(fi);
   psi:=pi-arcsin((e+a*sz)/b);
   r:=sin(psi); cz2:=cos(psi);
   xi:=a*cz-b*cz2; //s
    mex2.Canvas.Pen.Color:=clblack;
    rismex;
   // delay_wait(50);
    sleep(50); application.ProcessMessages;
    if checkbox1.Checked then
    mex2.Canvas.Pen.Color:=clSkyblue
    else
    mex2.Canvas.Pen.Color:=image1.Canvas.Brush.Color;
    rismex;
   fi:=fi+dfi;
  end;
   fi:=fi-dfi;
    mex2.Canvas.Pen.Color:=clblack;
    rismex;
end;

end.
