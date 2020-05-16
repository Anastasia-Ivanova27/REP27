﻿unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm) //это класс формы
    Button1: TButton;   //начало поля
    DV1: TEdit;
    DV2: TEdit;
    DT1: TEdit;
    DT2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;   //один из объектов
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MIo: TMenuItem;
    MIs: TMenuItem;
    MIso: TMenuItem;
    MIi: TMenuItem;
    MIc: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog; //конец поля
    procedure Button1Click(Sender: TObject); //это методы класса
    procedure MIoClick(Sender: TObject); //когда пользователь откажется от выбора файла
    procedure MIsClick(Sender: TObject); //то будет ошибка i/o 103
    procedure MIsoClick(Sender: TObject);
    procedure MIiClick(Sender: TObject); //в имплементации имя метод класса описывается полностью
    procedure MIcClick(Sender: TObject); //между procedure и именем метода обязательно пишется имя класса+точка между именами
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var v1,v2,t1,t2,v,t:real;
begin
v1:=strtofloat (DV1.text);
v2:=strtofloat (DV2.text);
if (v1<=0) or (v2<=0) then
begin
ShowMessage('Неправильный ввод объёма!');
exit;
end;
t1:=strtofloat (DT1.text);
t2:=strtofloat (DT2.text);
FindVT(v1,v2,t1,t2,v,t);
Memo1.Lines.Add('V1 = '+DV1.Text+'  V2 = '+DV2.Text);
Memo1.Lines.Add('T1 = '+DT1.Text+'  T2 = '+DT2.Text);
Memo1.Lines.Add('Общий объём = '+floattostr(v));
Memo1.Lines.Add('Общая температура = '+floattostr(t));
end;
{процедура для кнопки открыть}
procedure TForm1.MIoClick(Sender: TObject);
 var FN,s,s1,s2,s3: string; {FN для удобства, чтобы имя файла автоматом ставилось}
f:textfile;
begin
if OpenDialog1.Execute then {открывает проверяет}
begin
FN := OpenDialog1.FileName; {присваивает в переменную имя файла, который мы выбрали}
AssignFile(f,FN);
Reset(f);
readln(f,s); {считываем построчно}
readln(f,s1);
readln(f,s2);
readln(f,s3);
DV1.Text:=s; {заполняем}
DT1.Text:=s1;
DV2.Text:=s2;
DT2.Text:=s3;
end;
closeFile(f);
end;
{процедура для кнопки сохранить}
procedure TForm1.MIsClick(Sender: TObject);
var FN,s,s1,s2,s3: string;
f:textfile;
begin
if SaveDialog1.Execute then
FN := SaveDialog1.FileName;
AssignFile(f,FN);
Append(f);
s:=DV1.Text;
s1:=DT1.Text;
s2:=DV2.Text;
s3:=DT2.Text;
writeln(f,s);
writeln(f,s1);
writeln(f,s2);
writeln(f,s3);
closeFile(f);
end;
{процедура для кнопки сохранить отчёт}
procedure TForm1.MIsoClick(Sender: TObject);
begin
Memo1.Lines.SaveToFile('Отчётик.txt');
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
