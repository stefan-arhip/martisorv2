unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm6 = class(TForm)
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
  Form6: TForm6;

implementation

uses Unit7, Unit8, Unit4, Unit3;

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
begin
  BorderStyle:= bsNone;
  Image1.Left:= 0;
  Image1.Top:= 0;
  Image1.Transparent:= True;
  Width:= Image1.Width;
  Height:= Image1.Height;
  Left:= 5* (Screen.Width Div 6)- Width Div 2;
  Top:= Screen.Height- 110;//- Height;
  Color:= clWhite;
  TransparentColor:= True;
  TransparentColorValue:= Color;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
  If Top> Screen.Height- Round(1/ 3* Height) Then
    Begin
      Top:= Top- 5;
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
      Form3.Timer1.Enabled:= True;
      Form3.Show;
    End;
end;

end.
