unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MMenu: TMainMenu;
    Memo1: TMemo;
    MIo: TMenuItem;
    MIs: TMenuItem;
    MIso: TMenuItem;
    MIi: TMenuItem;
    MIc: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure MIcClick(Sender: TObject);
    procedure MIiClick(Sender: TObject);
    procedure MIoClick(Sender: TObject);
    procedure MIsClick(Sender: TObject);
    procedure MIsoClick(Sender: TObject);
    function DataFromForm:boolean;
  private

  public

  end;

var
  Form1: TForm1;
  var a, b, c: real;
  col:integer;
implementation

{$R *.lfm}

{ TForm1 }

function TForm1.DataFromForm:boolean;
var e:string;
f:boolean;
begin
  e:='';
  result:=false; f:=false;
  if TryStrToFloat(Edit1.text,a) = false then
  begin
     e:=e+'Несовместимый тип AB'+#10;
     Edit1.Color:=clRed; f:=True;
  end
  else if (a<=0) then
    begin
    e:=e+'Значение AB должно быть положительным'+#10;
    Edit1.Color:=clRed; f:=True;
    end
    else Edit1.Color:=clWhite;
  if TryStrToFloat(Edit2.text,b) = false then
  begin
     e:=e+'Несовместимый тип BC'+#10;
     Edit2.Color:=clRed; f:=True;
  end
  else if (b<=0) then
    begin
    e:=e+'Значение BC должно быть положительным'+#10;
    Edit2.Color:=clRed; f:=True;
    end
    else Edit2.Color:=clWhite;
    if TryStrToFloat(Edit3.text,c) = false then
  begin
     e:=e+'Несовместимый тип AC'+#10;
     Edit3.Color:=clRed; f:=True;
  end
  else if (c<=0) then
    begin
    e:=e+'Значение AC должно быть положительным'+#10;
    Edit3.Color:=clRed; f:=True;
    end
    else Edit3.Color:=clWhite;

  if f = true then
  begin
  ShowMessage(e);
  exit;
  end;
  result:=true;
end;

procedure TForm1.Button1Click(Sender: TObject);
var h1,h2,h3:real;
begin
if DataFromForm = false then exit;
h1:=0;h2:=0;h3:=0;
FindH (a,b,c,h1,h2,h3);
inc(col);
Memo1.Lines.Add('Старт #'+floattostr(col));
Memo1.Lines.Add('Длины: AB = '+Edit1.Text+'  BC = '+Edit2.Text+'  AC = '+Edit3.Text);
Memo1.Lines.Add('Высоты равны: ');
Memo1.Lines.Add('От С = '+FloatToStr(h1)+'.  От B = '+ FloatToStr (h3) +'.  От A = '+ FloatToStr (h2)+'.');
Memo1.SetFocus;
end;

procedure TForm1.MIcClick(Sender: TObject);
begin
close;
end;

procedure TForm1.MIiClick(Sender: TObject);
begin
ShowMessage('Задание №23 из задачника'+#10+'Автор: Иванова А. ИВТ-19-2');
end;

procedure TForm1.MIoClick(Sender: TObject);
begin
if OpenDialog1.Execute then {открывает проверяет}
if OpenDialog1.Execute then
   if OpenDialog1.FileName <> '' then  // пользователь мог не выбрать имя файла, а просто закрыть окно//
   begin
   ImportD(a,b,c,OpenDialog1.FileName);
   Edit1.Text:=FloatToStr(a);
   Edit2.Text:=FloatToStr(b);
   Edit3.Text:=FloatToStr(c);
   end;
end;

procedure TForm1.MIsClick(Sender: TObject);
begin
if DataFromForm = false then exit;
if SaveDialog1.Execute then
        if SaveDialog1.FileName <> '' then  // пользователь мог не выбрать имя файла, а просто закрыть окно//
          begin
ExportD(a,b,c,OpenDialog1.FileName);
          end;
end;

procedure TForm1.MIsoClick(Sender: TObject);
begin
Memo1.Lines.SaveToFile('Отчётик.txt');
end;

end.

