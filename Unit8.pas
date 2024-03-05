unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus;

type
  TForm8 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    ragedeMartisor1: TMenuItem;
    pentrualmuta1: TMenuItem;
    N1: TMenuItem;
    Quit1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Quit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

Uses Unit1;

procedure TForm8.FormCreate(Sender: TObject);
begin
  BorderStyle:= bsNone;
  Image1.Left:= 0;
  Image1.Top:= 0;
  Image1.Transparent:= True;
  Image1.Hint:= 'Trage de Martisor'#13'pentru a-l muta'#13#13'Click dreapta pentru inchidere';
  Width:= Image1.Width;
  Height:= Image1.Height;
  Left:= Screen.Width- Width;
  Top:= 30;
  Color:= clWhite;
  TransparentColor:= True;
  TransparentColorValue:= Color;
end;

procedure TForm8.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Form8.Handle, WM_SYSCOMMAND, 61458, 0);
end;

procedure TForm8.Quit1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm8.Timer1Timer(Sender: TObject);
begin
  If AlphaBlendValue+ 20< 255 Then
    AlphaBlendValue:= AlphaBlendValue+ 20
  Else
    Timer1.Enabled:= False;
end;

end.



