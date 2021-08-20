unit App.View.Fornecedores.Sub;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Types,

  Router4D,
  Router4D.Interfaces,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants, FMX.Edit;

type
  TFrmCadFornecedores = class(TForm, iRouter4DComponent)
    LytGeral: TLayout;
    Rectangle3: TRectangle;
    lytTool: TLayout;
    Rectangle11: TRectangle;
    Label20: TLabel;
    Layout13: TLayout;
    Path7: TPath;
    SpeedButton1: TSpeedButton;
    Layout1: TLayout;
    edtApelido: TEdit;
    Layout2: TLayout;
    edtFone: TEdit;
    Layout3: TLayout;
    edtCEP: TEdit;
    Layout4: TLayout;
    edtBairro: TEdit;
    Layout5: TLayout;
    edtEndereco: TEdit;
    Layout6: TLayout;
    edtCNPJ: TEdit;
    Layout7: TLayout;
    edtRazao: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  FrmCadFornecedores: TFrmCadFornecedores;

implementation

{$R *.fmx}

function TFrmCadFornecedores.Render: TFMXObject;
begin
  Result := LytGeral;
end;

procedure TFrmCadFornecedores.SpeedButton1Click(Sender: TObject);
begin
  TRouter4D.Link.&To('Fornecedores');
end;

procedure TFrmCadFornecedores.UnRender;
begin

end;

end.
