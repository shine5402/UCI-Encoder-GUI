unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    HelpButton1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    HelpButton2: TButton;
    HelpButton3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HelpButton1Click(Sender: TObject);
    procedure HelpButton2Click(Sender: TObject);
    procedure HelpButton3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure x_save();
    procedure p_save();
    procedure sleeptime_save();
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
procedure TForm3.sleeptime_save();
begin
   if Edit3.Text<>'' then begin
  sleeptime:=strtoint(edit3.text);
  end else begin
   sleeptime:=500;
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  x_save;
  p_save;
  sleeptime_save;
  Form3.Close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Close
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  edit1.Text:=x1;
  x_save;
  edit2.Text:=p1;
  p_save;
  edit3.Text:=inttostr(sleeptime);
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
'注意：您仍然需要根据您的编译器类型选择面板上的x264/x265选项，因为它们调用的参数是不同的。您也可以结合-x使用。');
end;

procedure TForm3.HelpButton3Click(Sender: TObject);
begin
  showmessage('该设置定义了UCI Encoder GUI在运行iconv.exe之后要等待多久才开始运行批处理。单位：毫秒。'+#10+
'由于Lazarus的TStringList的保存函数保存的是utf-8文档，这会导致批处理出现乱码问题，所以本程序会调用iconv.exe进行编码转换。虽然这个转换很快，但还是有可能发生iconv.exe还没有转换完成时GUI便已经调用批处理的情况。这会导致程序运行批处理之后的动作不符合预期。所以GUI在运行iconv.exe之后会有一段休眠时间来等待iconv.exe结束。在v1.30及之前的版本中，该数字被设定为500。但是在遇到大量文件或者计算机运算能力不够时可能还需要调整。'+#10+
'注意：这个设置除非真的真的有必要，还是不要随意修改的好。');
end;

end.

