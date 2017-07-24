unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation
uses unit1;
{$R *.lfm}

{ TForm3 }

procedure TForm3.Label4Click(Sender: TObject);
begin
  showmessage('-x 与 -X 参数可以使使用者自定义 x264/x265 程序的压制参数。'+#10+'应用此参数会使程序忽略掉质量参数，还请注意。'+#10+'请小心使用。');
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  if Edit1.Text<>'' then begin
    x_on:=true;
    x:=' -x "'+Edit1.Text+'"';
    Form1.Label1.Enabled:=false;
    Form1.Edit1.Enabled:=false;
    Form1.Label3.Enabled:=false;
    Form1.Edit2.Enabled:=false;
    Form1.Label2.Enabled:=false;
  end else begin
   x_on:=false;
    x:='';
    Form1.Label1.Enabled:=true;
    Form1.Edit1.Enabled:=true;
    Form1.Label3.Enabled:=true;
    Form1.Edit2.Enabled:=true;
    Form1.Label2.Enabled:=true;
  end;
  Form3.Close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Close
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
if x_on then begin
  edit1.Text:=x1;
  button1.click;
  end;
end;

end.

