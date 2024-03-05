unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Math;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

Procedure BuzzObject(aObject: TWinControl);
Var i: Integer;
    OldPos: TPoint;
Begin
  Randomize;
  OldPos.X:= aObject.Left;
  OldPos.Y:= aObject.Top;
  For i:= 0 To 50 Do
    Begin
      aObject.Left:= OldPos.X+ RandomRange(-15, 15);
      aObject.Top:= OldPos.Y+ RandomRange(-15, 15);
      Sleep(10);
    End;
  aObject.Left:= OldPos.X;
  aObject.Top:= OldPos.Y;
End; 

procedure TForm2.FormCreate(Sender: TObject);
begin
  BorderStyle:= bsNone;
  Image1.Left:= 0;
  Image1.Top:= 0;
  Image1.Transparent:= True;
  Width:= Image1.Width;
  Height:= Image1.Height;
  Left:= (Screen.Width- Width) Div 2;
  Top:= Screen.Height Div 3- Height;
  Color:= clWhite;
  TransparentColor:= True;
  TransparentColorValue:= Color;
  AlphaBlend:= True;
  AlphaBlendValue:= 0;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  Timer2.Enabled:= True;
end;

procedure TForm2.Timer2Timer(Sender: TObject);
begin
  AlphaBlendValue:= 255;
  BuzzObject(Form2);
//  If AlphaBlendValue+ 20< 255 Then
//    AlphaBlendValue:= AlphaBlendValue+ 20
//  Else
//    Begin
      Timer2.Enabled:= False;
      Timer3.Enabled:= True;
//    End;
end;

procedure TForm2.Timer3Timer(Sender: TObject);
begin
  Timer3.Enabled:= False;
  Timer4.Enabled:= True;

  Form6.Timer1.Enabled:= True;
  Form6.Show;
end;

procedure TForm2.Timer4Timer(Sender: TObject);
begin
  If AlphaBlendValue- 20> 0 Then
    AlphaBlendValue:= AlphaBlendValue- 20
  Else
    Begin
      AlphaBlendValue:= 0;
      Timer4.Enabled:= False;
      Form2.Close;
    End;
end;

end.
