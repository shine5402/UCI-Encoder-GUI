unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;
  t:integer;
implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Memo1Change(Sender: TObject);
begin

end;

procedure TForm2.Image1Click(Sender: TObject);
begin
t:=t+1;
if t=10 then begin image1.Hide;
image2.show;
end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
t:=0;
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
t:=0;
image1.show;
image2.hide;
end;

end.

