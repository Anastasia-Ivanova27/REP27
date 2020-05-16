program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Form1.StrGrid.Cells[0, 0]:='#';
    Form1.StrGrid.Cells[1, 0]:='V1';
  Form1.StrGrid.Cells[2, 0]:='T1';
    Form1.StrGrid.Cells[3, 0]:='V2';
  Form1.StrGrid.Cells[4, 0]:='T2';
    Form1.StrGrid.Cells[5, 0]:='Общий V';
  Form1.StrGrid.Cells[6, 0]:='Общая Т';
  Application.Run;
end.

