unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm7 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit2, Unit8, Unit1, Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
  BorderStyle:= bsNone;
  Image1.Left:= 0;
  Image1.Top:= 0;
  Image1.Transparent:= True;
  Width:= Image1.Width;
  Height:= Image1.Height;
  Left:= (Screen.Width- Width) Div 2;
  Top:= Screen.Height Div 4- Height;
  Color:= clWhite;
  TransparentColor:= True;
  TransparentColorValue:= Color;
  AlphaBlend:= True;
  AlphaBlendValue:= 0;
end;

procedure TForm7.Timer1Timer(Sender: TObject);
begin
  If AlphaBlendValue+ 20< 255 Then
    AlphaBlendValue:= AlphaBlendValue+ 20
  Else
    Begin
      Timer1.Enabled:= False;
      Timer2.Enabled:= True;
    End;
end;

procedure TForm7.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled:= False;
  Timer3.Enabled:= True;
end;

procedure TForm7.Timer3Timer(Sender: TObject);
begin
  Form1.AlphaBlend:= True;
  Form3.AlphaBlend:= True;
  Form4.AlphaBlend:= True;
  Form5.AlphaBlend:= True;
  Form6.AlphaBlend:= True;
  If AlphaBlendValue- 20> 0 Then
    AlphaBlendValue:= AlphaBlendValue- 20
  Else
    Begin
      AlphaBlendValue:= 0;
      Timer3.Enabled:= False;
      Form1.Hide;
      Form3.Close;
      Form4.Close;
      Form5.Close;
      Form6.Close;
      Form7.Close;
    End;
  Form1.AlphaBlendValue:= AlphaBlendValue;
  Form3.AlphaBlendValue:= AlphaBlendValue;
  Form4.AlphaBlendValue:= AlphaBlendValue;
  Form5.AlphaBlendValue:= AlphaBlendValue;
  Form6.AlphaBlendValue:= AlphaBlendValue;
end;

end.
