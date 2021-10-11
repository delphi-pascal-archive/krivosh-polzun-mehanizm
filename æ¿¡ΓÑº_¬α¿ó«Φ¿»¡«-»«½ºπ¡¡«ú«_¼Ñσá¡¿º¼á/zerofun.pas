unit zerofun;
interface
uses math;
 type
    arraytype=array[1..maxint div sizeof(double)] of double;
      funtype=function(x:double):double;
      _funtype=procedure(var x,f:arraytype);
      function find_sol(a,b,h:double; fun:funtype; var x1,x2:double):boolean;

       function zeroin(ax,bx:double; f:funtype; tol:double):double;
   procedure root (a, eps :double; n: integer;
                fun : funtype; var g,c : double);
 procedure chord (x0,x1,eps,del : double;
                fun :funtype;  var sol : double);
  procedure ribac(a,b,eps,m:double; fun:funtype; var n:integer; var x);
   procedure ppmetod(a,b,eps,h:double; fun:funtype; var n:integer; var x);
  procedure _eit_stef(x0,eps:double; fun:funtype; var x:double);
  procedure _cwinec(a,b,eps,x0:double; fun:funtype; var x:double);
   procedure newt12(wes:double; var x0:double; eps:double; fun:funtype);
    procedure mpi1(wes,eps:double; fun:funtype; var x:double);
  procedure mpi(n:integer; eps:double; funi:_funtype; var xi,fi);
 procedure newmel(var ai; n:integer; eps:double; var zi);
 procedure lob(var ai;n:integer; eps:double; var xi);

implementation
 function zeroin(ax,bx:double; f:funtype; tol:double):double;
  var
   a,b,c,d,e,eps,fa,fb,fc,tol1,xm,p,q,r,s:double;
  label 30,70;
   begin
    eps:=1; while 1+eps/2<>1 do eps:=eps/2;
    a:=ax; b:=bx; fa:=f(a); fb:=f(b);
    repeat
     c:=a; fc:=fa;
     d:=b-a; e:=d;
   30:
     if abs(fc)<abs(fb) then
      begin
       a:=b; b:=c; c:=a;
       fa:=fb; fb:=fc; fc:=fa;
     end;
     tol1:=2*eps*abs(b)+tol/2;
     xm:=(c-b)/2;
     if (abs(xm)<=tol1) or (fb=0) then
      begin
       zeroin:=b; exit
     end;
     if (abs(e)<tol1) or (abs(fa)<=abs(fb)) then goto 70
      else
       begin
        if a=c then
         begin
          s:=fb/fa;
          p:=2*xm*s;
          q:=1-s
         end
         else
          begin
           q:=fa/fc;
           r:=fb/fc;
           s:=fb/fa;
           p:=s*(2*xm*q*(q-r)-(b-a)*(r-1));
           q:=(q-1)*(r-1)*(s-1)
          end;
         if p>0 then q:=-q;
         p:=abs(p)
        end;
        if (2*p<3*xm*q-abs(tol1)*q) and (p<abs(e*q/2)) then
         begin
          e:=d; d:=p/q
         end
         else
         begin
       70: d:=xm; e:=d
         end;
          a:=b;
          fa:=fb;
          if abs(d)>tol1 then b:=b+d
           else
            if xm<0 then b:=b-abs(tol1)
             else b:=b+abs(tol1);
          fb:=f(b);
          if fb*(fc/abs(fc))<=0 then goto 30
        until false
      end;
  procedure root (a, eps :double; n: integer;
                fun : funtype; var g,c : double);
    {  HAXOДИТ КОРНИ УРАВНЕНИЯ      G =FUN(Y);
             G - ИСКОМЫЙ КОРЕНЬ
       C=FUN(G)-G;
       A - НАЧАЛЬНОЕ ПРИБЛИЖЕНИЕ
       EPS - ТОЧНОСТЬ     ; N - ЧИСЛО ИТЕРАЦИЙ    }
       var b,d,h : double;
           j ,m : integer;
    begin
         m:=1;  g:=0;   c:=0;
         if  fun(0) = 0  then exit;
         g:=fun(a);  c:=g-a;   b:=c;  d:=c;
         if  c=0  then  exit;
         for  j:=1  to  n  do
           begin  c:=fun(g)-g;
             if  abs(c)<=abs(g)*eps  then  exit;
             h:=b/c;  b:=c;
             if  h=1 then  exit;
             if (h>0)  and (h<2)  then m:=m+1;
                d:=d/(h-1);   g:=g+d;
            end;
           m:=-m;
    end;
  procedure chord (x0,x1,eps,del : double;
                 fun :funtype;  var sol : double);
 {решение уравнения вида fun(x)=0 методом хорд}
   label m;
   var dx,f0,f1 : double;
   begin
      dx:=x1-x0;
      f0:=fun(x0);
   m: f1:=fun(x1);
      dx:=f1*dx/(f0-f1);
      x0:=x1;
      f0:=f1;
      x1:=x1+dx;
      if  abs(dx)-del*abs(x1) > eps  then goto m;
      sol :=x1;
   end;
 procedure ribac(a,b,eps,m:double; fun:funtype; var n:integer; var x);
   { Нахождение всех коpней функции F(X)=0 методом Рыбакова}
      var xi,f,z,w,y,u:double;
          t:boolean;
          xx:arraytype absolute x;
      begin
       xi:=a; t:=false; n:=0;
       repeat
        f:=fun(xi);
        z:=xi+abs(f)/m;
        if z>=b then exit;
        if z-xi<eps then
         begin
          if not t then w:=z;
          xi:=z+eps; y:=z; t:=true;
         end
         else
         begin if t then
          begin n:=n+1; xx[n]:=(y+w)/2;
           t:=false end;
            xi:=z;
         end;
       until false;
   end;
   procedure ppmetod(a,b,eps,h:double; fun:funtype; var n:integer; var x);
    { Нахождение всех коpней функции F(x)=0 методом поpазpядного пpиближения}
     var f:double; w:integer;
         xi,c,r:extended;
     xx:arraytype absolute x;
     begin
      c:=h; n:=0; xi:=a; f:=fun(xi);
      if f>0 then w:=1 else w:=-1;
      repeat
       xi:=xi+c; r:=xi-c; if r>=b then exit;
       f:=fun(xi);
       if (f*w/c<0) or (r=xi) then
        begin
         c:=-c/4;
         if (abs(c)<eps/4) or (r=xi) then
          begin
           n:=n+1;
           xx[n]:=xi;
           c:=h; w:=-w;
          end;
        end;
        until false;
   end;
  procedure _eit_stef(x0,eps:double; fun:funtype; var x:double);
 {Решение уpавнения X=F(x) методом Эйткена-Стеффенсона}
    var b,f,c:double;
    begin x:=x0;
     repeat
      b:=fun(x);
      f:=fun(b); c:=x-2*b+f;
      if c<>0 then x:=(x*f-b*b)/c;
     until abs(x-f)<=eps;
    end;
  procedure _cwinec(a,b,eps,x0:double; fun:funtype; var x:double);
 {Решение уpавнения F(x)=0 методом квадpатичной интеpполяции-экстpаполяции}
     var l,m,f,q,n,p:double;
     begin
      l:=fun(a); m:=fun(b);
      x:=x0;
      p:=(b-a)/(m-l);
      repeat
       f:=fun(x); q:=x;
       n:=(x-a)/(f-l);
       x:=a-l*(n+(n-p)*f/(m-f));
     until abs(q-x)<=eps;
   end;
   procedure newt12(wes:double; var x0:double; eps:double; fun:funtype);
   {Решение уpавнения F(X)=0 по методу Ньютона
    пpи pr=true функция записывается в виде F(X)/F`(X)}
    var x,f:double;
     begin
      x:=x0; f:=1;
         while abs(f)>eps do
          begin
           f:=fun(x);
           x:=x-wes*eps*f/(fun(x+eps)-f);
          end;
      x0:=x
     end;
  procedure mpi(n:integer; eps:double; funi:_funtype; var xi,fi);
    {Решение системы нелинейных уpавнений методом пpостых итеpаций}
    var i:integer;
        fl:boolean;
        x:arraytype absolute xi;
        f:arraytype absolute fi;
     begin
       for i:=1 to n do f[i]:=1;
       fl:=true;
       while fl do
       begin
       funi(x,f);
       fl:=false;
        for i:=1 to n do
         begin
          if abs(f[i])>eps*eps then fl:=true;
          x[i]:=x[i]+f[i];
         end;
       end;
     end;
  procedure mpi1(wes,eps:double; fun:funtype; var x:double);
    {Решение нелинейного уpавнения методом пpостых итеpаций}
    var wes1,f:double;
     begin
       f:=1;
       if wes=0 then wes1:=-eps/(fun(x+eps)-fun(x)) else wes1:=wes;
       while abs(f)>eps do
       begin
       f:=fun(x);
        x:=x+f*wes1
       end;
     end;
  procedure newmel(var ai; n:integer; eps:double; var zi);
     {определение вещест. корней полинома методом Ньютона-Миели:
         P(x)=a[0]x^n + ... + a[n]}
       label iter;
         type arrnm=array[1..21] of double;
     var aa,pp,gg,x0,x1,s:double;
         i,m:integer;
         b,p,g:arrnm;
         a:arraytype absolute ai;
         z:arraytype absolute zi;
     procedure horner(var pi,gi; n:integer; x:double;
                       var pp,gg:double);
           var i:integer;
           p:arraytype absolute pi;
           g:arraytype absolute gi;
         begin
              gg:=0; pp:=0;
           for i:=1 to n do
      begin
        pp:=pp*x+p[i];
        gg:=gg*x+g[i];
      end;
    pp:=pp*x+p[n+1];
  end;
    begin
        aa:=a[1]; p[1]:=aa;
        x0:=0; pp:=0;
        s:=sign(a[1]);
    for i:=2 to n+1 do
     if s*a[i]<0 then
   begin
     if pp=0 then pp:=i;
     if x0<abs(a[i]) then x0:=abs(a[i])
   end;
     if pp=0 then x0:=0 else x0:=1+eps*(ln(abs(x0/aa))/pp);
   for i:=1 to n do b[i]:=(n-i)*a[i];
   for m:=1 to n do
 begin
   iter: horner(a,b,n,x0,pp,gg);
        x1:=x0-pp/gg;
      if abs(x1-x0)>eps*abs(x1) then
   begin
     x0:=x1; goto iter end;
     z[m]:=x1;
    b[1]:=b[1]-aa; pp:=b[1]; g[1]:=pp;
    if m<n then
       begin
           for i:=2 to n do
         begin
            p[i]:=x1*p[i-1]+a[i];
            g[i]:=x1*g[i-1]+pp
        end;
     horner(p,g,n-1,x1,pp,gg);
     x0:=x1-pp/gg
     end;
    end;
   end;
   procedure lob(var ai;n:integer; eps:double; var xi);
   { Опpеделение коpней полинома
      a[0]+a[1]x+...+a[n]x^n=0 методом Лобочевского}
      label 1;
      type arr=array[1..21] of double;
      var z,i,j,k,j1:integer;
      r,d,g,bi:double;
      b,c:arr;
      a:arraytype absolute ai;
      x:arraytype absolute xi;
      begin
       for i:=1 to n+1 do
        begin b[i]:=a[i]/a[n+1]; c[i]:=0 end;
       r:=1/2; g:=1;
     1: z:=1;
        for i:=0 to n do
         begin
          bi:=z*b[i+1]; k:=(i+1) div 2;
            j:=i mod 2;
            while j<=n do
             begin
              c[k+1]:=c[k+1]+b[j+1]*bi;
              k:=k+1; j:=j+2;
             end;
            z:=-z;
          end;
         d:=z*c[n];
         if d<=0 then
          begin
           for i:=1 to n+1 do
             begin b[i]:=c[i]; c[i]:=0; end
          end
          else begin
                 g:=g*Power(d,r); writeln(g);
                 for i:=0 to n do
                  begin b[i+1]:=c[i+1]/Power(d,n-1); c[i+1]:=0 end;
                 b[n]:=z; b[n+1]:=-z;
               end;
               r:=r/2;
               goto 1;
      end;
      function find_sol(a,b,h:double; fun:funtype; var x1,x2:double):boolean;
      begin
       find_sol:=false;
       x2:=a;
       while x2<=b do
        begin
        x1:=x2;
        x2:=x2+h;
        if fun(x1)*fun(x2)<=0 then
         begin find_sol:=true; exit end;
        end;
      end;
  end.