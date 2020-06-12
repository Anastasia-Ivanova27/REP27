unit Unit2;

{$mode objfpc}{$H+}

interface
{импортировать данные}
procedure ImportD(var v1,v2,t1,t2:real; FName:string);
{экспортировать данные}
procedure ExportD(v1,v2,t1,t2:real; FName:string);
{процедура смешивания жидкостей}
Procedure FindVT (v1,v2,t1,t2:real; var v,t:real);

implementation

Procedure FindVT (v1,v2,t1,t2:real; var v,t:real);
begin
t:=(v1*t1+v2*t2)/(v1+v2);
v:=v1+v2;
t:=round(t*100)/100;
v:=round(v*100)/100;
end;

procedure ImportD(var v1,v2,t1,t2:real; FName:string);
var f:textfile;
begin
AssignFile(f,FName);
Reset(f);
readln(f,v1);
readln(f,v2);
readln(f,t1);
readln(f,t2);
closeFile(f);
end;

procedure ExportD(v1,v2,t1,t2:real; FName:string);
var f:textfile;
begin
AssignFile(f,FName);
rewrite(f);
writeln(f,v1);
writeln(f,v2);
writeln(f,t1);
writeln(f,t2);
closeFile(f);
end;

end.

