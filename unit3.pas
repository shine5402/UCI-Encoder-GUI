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
    HelpButton1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    HelpButton2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HelpButton1Click(Sender: TObject);
    procedure HelpButton2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure x_save();
    procedure p_save();
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

end;
procedure TForm3.x_save();
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
  end;
procedure TForm3.p_save();
begin
   if Edit2.Text<>'' then begin
    p_on:=true;
    p:=' -p "'+Edit2.Text+'"';
  end else begin
   p_on:=false;
    p:='';
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  x_save;
  p_save;
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
  x_save;
  edit2.Text:=p1;
  p_save;
  end;
end;

procedure TForm3.HelpButton1Click(Sender: TObject);
begin
  showmessage('该设置对应了ucienc.exe的-x参数。'+#10+
'UCI (Ultra Compact Image) Encoder 0.602 [by dwing] 2017-06-08'+#10+
'Options: -x "......"   use custom detail x264/5 options for RGB/YUV channel, ignore -q/-Q, use carefully.'+#10+
'该参数可以令程序使用您自定义的x264/5参数，由于-X参数默认与-x相同，所以您在程序中设置的参数同时对应两个通道。'+#10+
'使用该参数后ucienc.exe会忽略质量参数 (-q)，所以还请小心。');
end;

procedure TForm3.HelpButton2Click(Sender: TObject);
begin
  showmessage('该设置对应了ucienc.exe的-p参数。'+#10+
'UCI (Ultra Compact Image) Encoder 0.602 [by dwing] 2017-06-08'+#10+
'Options: -p <progname> set x264/5 program file name, default: x264/5.exe'+#10+
'该参数可以令程序调用您定义的x264/5程序文件名。'+#10+
'注意：您仍然需要根据您的编译器类型制定面板上的x264/x265选项，因为它们调用的参数是不同的。您也可以结合-x使用。');
end;

end.

