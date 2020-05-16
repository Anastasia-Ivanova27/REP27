unit Unit2;

{$mode objfpc}{$H+}

interface

// Запись - «Расчёт»
type Calculation = record
v1, t1, v2, t2: real; // исходные данные
v, t: real;  // результаты
end;

{процедура для нахождения результата}
procedure FindVT (v1,v2,t1,t2:real; var v:real; var t:real; var calc:Calculation);

implementation

procedure FindVT (v1,v2,t1,t2:real; var v:real; var t:real; var calc:Calculation);
begin
t:=(v1*t1+v2*t2)/(v1+v2);
v:=v1+v2;
t:=round(t*100)/100;
v:=round(v*100)/100;
//заполнение данных в отдельную запись
    calc.v1:=v1;
    calc.t1:=t1;
    calc.v2:=v2;
    calc.t2:=t2;
    calc.v:=v;
    calc.t:=t;
end;

end.

