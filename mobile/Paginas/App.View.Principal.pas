unit App.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrmViewMenu = class(TForm)
    lytMenu: TLayout;
    lytBtnFornecedores: TLayout;
    SpeedButton1: TSpeedButton;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Layout2: TLayout;
    SpeedButton2: TSpeedButton;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle3: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmViewMenu: TFrmViewMenu;

implementation

{$R *.fmx}

end.
