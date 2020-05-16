unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm) //это класс формы
    Button1: TButton; //начало поля
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;  //один из объектов
    MMenu: TMainMenu;
    Memo1: TMemo;
    MIo: TMenuItem;
    MIs: TMenuItem;
    MIso: TMenuItem;
    MIi: TMenuItem;
    MIc: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog; //конец поля
    procedure Button1Click(Sender: TObject); //это методы класса
    procedure MIcClick(Sender: TObject); //когда пользователь откажется от выбора файла
    procedure MIiClick(Sender: TObject); //то будет ошибка i/o 103
    procedure MIoClick(Sender: TObject); //в имплементации имя метод класса описывается полностью
    procedure MIsClick(Sender: TObject); //между procedure и именем метода обязательно пишется имя класса+точка между именами
    procedure MIsoClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var a,b,c,p,s,h1,h2,h3:real;
begin
a:=StrToFloat(Edit1.Text);
b:=StrToFloat(Edit2.Text);
c:=StrToFloat(Edit3.Text);
if (a<=0)or(b<=0)or(c<=0) then
begin
ShowMessage('Неправильный ввод сторон!');
exit;
end;
FindABC (a,b,c,h1,h2,h3);
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
var FN,s,s1,s2: string; {FN для удобства, чтобы имя файла автоматом ставилось}
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
Edit1.Text:=s; {заполняем}
Edit2.Text:=s1;
Edit3.Text:=s2;
end;
closeFile(f);
end;

procedure TForm1.MIsClick(Sender: TObject);
var FN,s,s1,s2: string;
f:textfile;
begin
if SaveDialog1.Execute then
FN := SaveDialog1.FileName;
AssignFile(f,FN);
rewrite(f);
s:=Edit1.Text;
s1:=Edit2.Text;
s2:=Edit3.Text;
writeln(f,s);
writeln(f,s1);
writeln(f,s2);
closeFile(f);
end;

procedure TForm1.MIsoClick(Sender: TObject);
begin
Memo1.Lines.SaveToFile('Отчётик.txt');
end;

end.

