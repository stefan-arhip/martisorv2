unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit7, Unit8, Unit3, Unit4;

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
begin
  BorderStyle:= bsNone;
  Image1.Left:= 0;
  Image1.Top:= 0;
  Image1.Transparent:= True;
  Width:= Image1.Width;
  Height:= Image1.Height;
  Left:= 3* (Screen.Width Div 6)- Width Div 2;
  Top:= Screen.Height- 80;//- Height;
  Color:= clWhite;
  TransparentColor:= True;
  TransparentColorValue:= Color;
end;

procedure TForm5.Timer1Timer(Sender: TObject);
begin
  If Top> Screen.Height- Round(1/ 3* Height) Then
    Begin
      Top:= Top- 4;
      Timer1.Interval:= 6;
    End
  Else If Top- 50> Screen.Height- Height Then
    Begin
      Top:= Top- 50;
      Timer1.Interval:= 3;
    End
  Else
    Begin
      Timer1.Enabled:= False;
      Form4.Timer1.Enabled:= True;
      Form4.Show;
    End;
end;

end.
