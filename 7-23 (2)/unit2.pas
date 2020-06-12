unit Unit2;

{$mode objfpc}{$H+}

interface

{импортировать данные}
procedure ImportD(var a,b,c:real; FName:string);
{экспортировать данные}
procedure ExportD(a,b,c:real; FName:string);
{процедура поиска высот}
Procedure FindH (a,b,c:real; var h1,h2,h3:real);

implementation

{процедура поиска высот}
Procedure FindH (a,b,c:real; var h1,h2,h3:real);
var p, s:real;
begin
p:=(a+b+c)/2;
s:=sqrt(p*(p-a)*(p-b)*(p-c));
h1:=round(100*s/a)/100;
h2:=round(100*s/b)/100;
h3:=round(100*s/c)/100;
end;

{импортировать данные}
procedure ImportD(var a,b,c:real; FName:string);
var f:textfile;
begin
  AssignFile(f,FName);
  Reset(f);
  readln(f,a);
  readln(f,b);
  readln(f,c);
  closeFile(f);
end;

{экспортировать данные}
procedure ExportD(a,b,c:real; FName:string);
var f:textfile;
begin
AssignFile(f,FName);
rewrite(f);
writeln(f,a);
writeln(f,b);
writeln(f,c);
closeFile(f);
end;

end.

