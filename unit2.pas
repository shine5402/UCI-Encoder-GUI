unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls,shellapi;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TForm2.Button2Click(Sender: TObject);
begin
  shellexecute(handle,'open','https://github.com/shine5402/UCI-Encoder-GUI',nil,nil,1);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
showmessage('此程序是自由软件，您可以依据自由软件基金会发布的GNU通用公共许可证（版本3，或取决于您的选择选择更高的版本）的条款重新分发和/或修改它。'+#10+
    '我们分发这个程序的目的是希望它有用，但是我们对它的可用性没有任何保证，甚至也没有对于适销性或适用于特定用途的默示保证。有关详细信息，请参阅GNU通用公共许可证。'+#10+
    '您应该在收到本程序的同时就已经收到GNU通用公共许可证的副本。 如果没有，请参阅<http://www.gnu.org/licenses/>。');
shellexecute(handle,'open','https://www.gnu.org/licenses/gpl.html',nil,nil,1);
end;

end.

