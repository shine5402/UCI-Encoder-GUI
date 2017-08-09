unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  EditBtn, Menus,shellapi,inifiles;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    x264radio: TRadioButton;
    RadioButton2: TRadioButton;
    x265radio: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure Label3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  output,q,x,x1,hevc,p,p1: string;
  batch:Tstringlist;
  x_on,p_on:boolean;
  settings:Tinifile;
implementation
uses unit2,Unit3;
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  settings:=Tinifile.create('./settings.ini');
  x1:=settings.readstring('advanced','x','');
  x_on:=settings.ReadBool('advanced','x_on',false);
  p1:=settings.readstring('advanced','p','');
  p_on:=settings.ReadBool('advanced','p_on',false);
 batch:=Tstringlist.Create;
 if not(fileexists('ucienc.exe'))then showmessage('没有在程序目录找到 UCI 编码器，除非你已经将 UCI 编码器所在路径加入环境变量，否则程序将无法运作。');
 if not(fileexists('imgdec.exe'))then showmessage('没有在程序目录找到 imgdec.exe，除非你已经将其所在路径加入环境变量，否则程序将无法运作。');
 if not(fileexists('x264.exe'))then showmessage('没有在程序目录找到 x264 编码器，除非你已经将 x264 编码器所在路径加入环境变量，否则程序的x264功能将无法运作。');
 if not(fileexists('x264.exe'))then showmessage('没有在程序目录找到 x265 编码器，除非你已经将 x265 编码器所在路径加入环境变量，否则程序的x265功能将无法运作。');
 if not(fileexists('iconv.exe') and fileexists('msys-2.0.dll') and fileexists('msys-gcc_s-1.dll') and fileexists('msys-iconv-2.dll') and fileexists('msys-intl-8.dll'))then showmessage('没有在程序目录找到iconv.exe及其相关dll，除非你已经将其所在路径加入环境变量，否则程序将无法运作。');
end;

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of String
  );
begin
Listbox1.Items.AddStrings(filenames);
end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
    s,s1:string;
begin
if Listbox1.Items.Count=0 then begin
showmessage('没有文件。');
exit();
end;
  s:='';
//判断质量参数
  if x264radio.Checked then q:='27'
    else q:='43';
  if Edit1.Text<>'' then begin
  q:=Edit1.text;
  if Edit2.Text<>'' then q:=q+'.'+Edit2.Text
  end
  else begin
    if x264radio.Checked then q:='27'
    else q:='43'
  end;
//判断结束
  batch.Clear;
  batch.Add('@echo off');
  batch.Add('cd '+ExtractFilePath(Application.Exename));
  batch.Add('title 开始运行……');
  batch.Add('color 3F');
  batch.Add('echo 本次共有'+inttostr(Listbox1.Items.Count)+'个文件要处理。');
//批处理文件头部写入完毕
if x265radio.Checked then hevc:=' -hevc' else hevc:='';//处理单选框（x264/x265）
for i:= 0 to Listbox1.Items.Count-1 do begin
      for j:= length(Listbox1.Items[i]) downto 1 do if Listbox1.Items[i][j]<>'.'then s:=Listbox1.Items[i][j]+s else break;
      if not((s='bmp') or (s='BMP') or (s='tga') or (s='TGA') or (s='png') or (s='PNG') or (s='jpg') or (s='JPG') or (s='jpeg') or (s='JPEG') or (s='gif') or (s='GIF') or (s='tif') or (s='TIF') or (s='TIFF') or (s='tiff') or (s='pcx') or (s='PCX') or (s='jp2') or (s='JP2') or (s='jpc') or (s='JPC')) then begin
        batch.Add('echo 发现无法转换的文件 '+ListBox1.Items[i]);
                  s:='';s1:='';
        continue
      end;
      batch.Add('echo 处理第'+inttostr(i+1)+'个文件，共'+inttostr(Listbox1.Items.Count)+'个');
      batch.Add('echo 文件路径为'+ListBox1.Items[i]);
      if (s='bmp') or (s='BMP') then batch.Add('ucienc.exe "'+ListBox1.Items[i]+hevc+'" -q '+q+p+x) else begin
        s1:=ListBox1.Items[i];
        delete(s1,length(s1)-length(s)+1,length(s));
        batch.Add('imgdec.exe "'+ListBox1.Items[i]+'" "'+s1+'bmp"');
        batch.Add('ucienc.exe "'+s1+'bmp"'+hevc+' -q '+q+p+x);
        batch.Add('del "'+s1+'bmp"');
        batch.Add('echo 一个文件已完成！');
                  s:='';s1:='';
  end;

end;
    s:='';s1:='';hevc:='';
    batch.Add('echo 全部文件完成。请直接关闭窗口。');
    batch.Add('color 2F');
    batch.Add('title 完成！');
    batch.Add('pause>nul');
      batch.Add('exit');
s:='';s1:='';
  batch.Add('echo 全部文件完成。请直接关闭窗口。');
  batch.Add('color 2F');
  batch.Add('title 完成！');
  batch.Add('pause>nul');
  batch.Add('exit');
  batch.SaveToFile('run-utf8.bat');
  ShellExecute(0,'open', 'cmd','/c iconv -f utf-8 -t gbk run-utf8.bat>run.bat',nil,5);
  sleep(500);
  ShellExecute(0,'open', 'cmd','/k run.bat',nil,5);
  ListBox1.Clear;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  ListBox1.Items.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ListBox1.Items.Delete(Listbox1.ItemIndex);
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  batch.Free;
  deletefile('run.bat');
  deletefile('run-utf8.bat');
    settings.WriteString('advanced','x',form3.edit1.Text);
  settings.WriteBool('advanced','x_on',x_on);
      settings.WriteString('advanced','p',form3.edit2.Text);
  settings.WriteBool('advanced','p_on',p_on);
  settings.free;
end;

end.

