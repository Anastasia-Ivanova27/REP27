unit Unit2;

{$mode objfpc}{$H+}

interface

procedure FindABC (a,b,c:real; var h1:real; var h2:real; var h3:real);
uses
  Classes, SysUtils;

implementation

procedure FindABC (a,b,c:real; var h1:real; var h2:real; var h3:real);
var p, s:real;
begin
p:=(a+b+c)/2;
s:=sqrt(p*(p-a)*(p-b)*(p-c));
h1:=round(100*s/a)/100;
h2:=round(100*s/b)/100;
h3:=round(100*s/c)/100;
end;

end.

