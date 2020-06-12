unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, Grids, unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    DV1: TEdit;
    DV2: TEdit;
    DT1: TEdit;
    DT2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MainMenu1: TMainMenu;
    MIo: TMenuItem;
    MIs: TMenuItem;
    MIso: TMenuItem;
    MIi: TMenuItem;
    MIc: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StrGrid: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure MIoClick(Sender: TObject);
    procedure MIsClick(Sender: TObject);
    procedure MIsoClick(Sender: TObject);
    procedure MIiClick(Sender: TObject);
    procedure MIcClick(Sender: TObject);
    function DataFromForm:boolean;
  private

  public

  end;

var
  Form1: TForm1;
  var v1, v2, t1, t2: real;
  var calcMas: array[1..128] of Calculation;
  var calc: Calculation; //отдельная запись для процедуры подсчёта
  col:integer; //счётчик заполненных строк

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.DataFromForm:boolean;
var e:string;
f:boolean;
begin
  e:='';
  result:=false; f:=false;
if TryStrToFloat(DV1.text,v1) = false then
  begin
     e:=e+'Несовместимый тип v1'+#10;
     DV1.Color:=clRed; f:=True;
  end
  else if (v1<=0) then
    begin
    e:=e+'Значение v1 должно быть положительным'+#10;
    DV1.Color:=clRed; f:=True;
    end
    else DV1.Color:=clWhite;
  if TryStrToFloat(DV2.text,v2) = false then
  begin
     e:=e+'Несовместимый тип v2'+#10;
     DV2.Color:=clRed; f:=True;
  end
  else if (v2<=0) then
    begin
    e:=e+'Значение v2 должно быть положительным'+#10;
    DV2.Color:=clRed; f:=True;
    end
    else DV2.Color:=clWhite;
  if TryStrToFloat(DT1.text,t1) = false then
  begin
     e:=e+'Несовместимый тип t1'+#10;
     DT1.Color:=clRed; f:=True;
  end
  else if (t1<=0) then
    begin
    e:=e+'Значение t1 должно быть положительным'+#10;
    DT1.Color:=clRed; f:=True;
    end
    else DT1.Color:=clWhite;
  if TryStrToFloat(DT2.text,t2) = false then
  begin
     e:=e+'Несовместимый тип t2'+#10;
     DT2.Color:=clRed; f:=True;
  end
  else if (t2<=0) then
    begin
    e:=e+'Значение t2 должно быть положительным'+#10;
    DT2.Color:=clRed; f:=True;
    end
    else DT2.Color:=clWhite;

  if f = true then
  begin
  ShowMessage(e);
  exit;
  end;
  result:=true;
end;


procedure TForm1.Button1Click(Sender: TObject);
var v,t:real;
begin
  if DataFromForm = false then exit;
  v:=0; t:=0;
  FindVT (v1,v2,t1,t2,v,t,calc);
  inc(col);
  StrGrid.Cells[0, col]:=IntToStr(col);         //заполняем номер строки
  StrGrid.Cells[1, col]:=FloatToStr(calc.v1);//заполняем исходные данные
  StrGrid.Cells[2, col]:=FloatToStr(calc.t1);
  StrGrid.Cells[3, col]:=FloatToStr(calc.v2);
  StrGrid.Cells[4, col]:=FloatToStr(calc.t2);
  StrGrid.Cells[5, col]:=FloatToStr(calc.v);
  StrGrid.Cells[6, col]:=FloatToStr(calc.t); //и результаты
  CalcMas[col]:=calc;                    //добавляем запись в массив
end;

{процедура для кнопки открыть}
procedure TForm1.MIoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
   if OpenDialog1.FileName <> '' then  // пользователь мог не выбрать имя файла, а просто закрыть окно//
   begin
   ImportD(v1,v2,t1,t2,OpenDialog1.FileName);
   DV1.Text:=FloatToStr(v1); {заполняем}
   DV2.Text:=FloatToStr(v2);
   DT1.Text:=FloatToStr(t1);
   DT2.Text:=FloatToStr(t2);
   end;
end;
{процедура для кнопки сохранить}
procedure TForm1.MIsClick(Sender: TObject);
begin
  if DataFromForm = false then exit;
  if SaveDialog1.Execute then
          if SaveDialog1.FileName <> '' then  // пользователь мог не выбрать имя файла, а просто закрыть окно//
            begin
  ExportD(v1,v2,t1,t2,OpenDialog1.FileName);
            end;
end;
{процедура для кнопки сохранить отчёт}
procedure TForm1.MIsoClick(Sender: TObject);
var
f:textfile;
i:integer;
begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
  begin
  AssignFile(f,SaveDialog1.FileName);
  append(f);
    write(f,'#':6);
    write(f,'V1':11);
    write(f,'T1':11);
    write(f,'V2':11);
    write(f,'T2':11);
    write(f,'Общий V':13);
    write(f,'Общиая T':13);
    writeln(f);
  for i:=1 to col do
   begin
    write(f,i:6);
    with calcMas[i] do
    begin
      write(f,v1:8:3);
      write(f,t1:8:3);
      write(f,v2:8:3);
      write(f,t2:8:3);
      write(f,v:10:3);
      write(f,t:10:3);
    end;
    writeln(f);
   end;
  closefile(f);
  end;
end;
{процедура для кнопки справка}
procedure TForm1.MIiClick(Sender: TObject);
begin
  ShowMessage('Задание №2 из задачника'+#10+'Автор: Иванова А. ИВТ-19-2');
end;
{процедура для кнопки закрыть}
procedure TForm1.MIcClick(Sender: TObject);
begin
  close;
end;

end.

