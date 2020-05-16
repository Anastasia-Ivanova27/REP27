unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

{процедура для нахождения результата}
procedure FindVT (v1,v2,t1,t2:real; var v:real; var t:real);

implementation

procedure FindVT (v1,v2,t1,t2:real; var v:real; var t:real);
begin
t:=(v1*t1+v2*t2)/(v1+v2);
v:=v1+v2;
//t:=round(t*100)/100;
//v:=round(v*100)/100;
end;

end.

