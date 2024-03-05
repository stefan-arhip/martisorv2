unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Quit1: TMenuItem;
    N1: TMenuItem;
    pentrualmuta1: TMenuItem;
    ragedeMartisor1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Quit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE, getWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW) ;
  ShowWindow(Application.Handle, SW_SHOW);

  BorderStyle:= bsNone;
  Image1.Left:= 0;
  Image1.Top:= 0;
  Image1.Transparent:= True;
  Width:= Image1.Width;
  Height:= Image1.Height;
  Left:= 2* (Screen.Width Div 6)- Width Div 2;
  Top:= Screen.Height;//- Height;
  Color:= clWhite;
  TransparentColor:= True;
  TransparentColorValue:= Color;
end;

procedure TForm1.Quit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  If Top> Screen.Height- Round(1/ 4* Height) Then
    Begin
      Top:= Top- 1;
      Timer1.Interval:= 20;
    End
  Else If Top- 50> Screen.Height- Height Then
    Begin
      Top:= Top- 50;
      Timer1.Interval:= 3;
    End
  Else
    Begin
      Timer1.Enabled:= False;
      Form2.Timer1.Enabled:= True;
      Form2.Show;
    End;
end;

end.
