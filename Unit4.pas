unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm4 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit7, Unit8, Unit3, Unit2, Unit6;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
  BorderStyle:= bsNone;
  Image1.Left:= 0;
  Image1.Top:= 0;
  Image1.Transparent:= True;
  Width:= Image1.Width;
  Height:= Image1.Height;
  Left:= 4* (Screen.Width Div 6)- Width Div 2;
  Top:= Screen.Height- 130;//- Height;
  Color:= clWhite;
  TransparentColor:= True;
  TransparentColorValue:= Color;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  If Top> Screen.Height- Round(1/ 3* Height) Then
    Begin
      Top:= Top- 6;
      Timer1.Interval:= 4;
    End
  Else If Top- 50> Screen.Height- Height Then
    Begin
      Top:= Top- 50;
      Timer1.Interval:= 3;
    End
  Else
    Begin
      Timer1.Enabled:= False;
      If Not Form7.Timer1.Enabled Then
        Begin
          Form7.Show;
          Form7.Timer1.Enabled:= True;
          Form8.Show;
          Form8.Timer1.Enabled:= True;
        End;
    End;
end;

end.
