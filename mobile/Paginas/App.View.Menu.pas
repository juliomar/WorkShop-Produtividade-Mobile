unit App.View.Menu;

interface

uses
  Router4D,

  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.ListBox,
  FMX.MultiView,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Types,

  Router4D.Interfaces,
  Router4D.Props,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TFrmViewMenu = class(TForm, iRouter4DComponent)
    lytMenuProc: TLayout;
    recFundoMenu: TRectangle;
    LytGeralMenu: TLayout;
    lytClientes: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    lytFornecedores: TLayout;
    Rectangle2: TRectangle;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    lytProdutos: TLayout;
    Rectangle3: TRectangle;
    SpeedButton3: TSpeedButton;
    lytTool: TLayout;
    lytPedidos: TLayout;
    Rectangle4: TRectangle;
    Label4: TLabel;
    SpeedButton4: TSpeedButton;
    lytNotasFiscais: TLayout;
    Rectangle5: TRectangle;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    lytAgenda: TLayout;
    Rectangle6: TRectangle;
    Label6: TLabel;
    SpeedButton6: TSpeedButton;
    lytPerfil: TLayout;
    Rectangle7: TRectangle;
    Label7: TLabel;
    SpeedButton7: TSpeedButton;
    lytSincronizar: TLayout;
    Rectangle8: TRectangle;
    Label8: TLabel;
    SpeedButton8: TSpeedButton;
    lytConfig: TLayout;
    Rectangle9: TRectangle;
    Label9: TLabel;
    SpeedButton9: TSpeedButton;
    lytRodape: TLayout;
    Path1: TPath;
    Layout1: TLayout;
    Layout2: TLayout;
    Path2: TPath;
    Layout3: TLayout;
    Path3: TPath;
    Layout4: TLayout;
    Path4: TPath;
    Layout5: TLayout;
    Path5: TPath;
    Layout6: TLayout;
    Path6: TPath;
    Layout7: TLayout;
    Path7: TPath;
    Layout9: TLayout;
    Path9: TPath;
    Rectangle10: TRectangle;
    Layout8: TLayout;
    Path8: TPath;
    Label3: TLabel;
    Label10: TLabel;
    Rectangle11: TRectangle;
    lytRelatorios: TLayout;
    Rectangle13: TRectangle;
    Layout11: TLayout;
    Path10: TPath;
    Label11: TLabel;
    SpeedButton10: TSpeedButton;
    lytMensagens: TLayout;
    Rectangle14: TRectangle;
    Layout13: TLayout;
    Path11: TPath;
    Label12: TLabel;
    SpeedButton11: TSpeedButton;
    lytAjuda: TLayout;
    Rectangle15: TRectangle;
    Layout15: TLayout;
    Path12: TPath;
    Label13: TLabel;
    SpeedButton12: TSpeedButton;
    lytGridGeral: TLayout;
    lstMenu: TListBox;
    Rectangle16: TRectangle;
    Image2: TImage;
    Rectangle12: TRectangle;
    procedure Layout2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  FrmViewMenu: TFrmViewMenu;

implementation

{$R *.fmx}

procedure TFrmViewMenu.Layout2Click(Sender: TObject);
begin

end;

{ TFrmViewMenu }

function TFrmViewMenu.Render: TFMXObject;
begin
  Result := LytGeralMenu;
end;

procedure TFrmViewMenu.SpeedButton1Click(Sender: TObject);
begin
  GlobalEventBus
    .Post(
      TProps
        .Create
          //.PropString(SpeedButton1.Name)
          .Key('MasterButton')
    );
  TRouter4D.Link.&To('Clientes');
end;

procedure TFrmViewMenu.SpeedButton2Click(Sender: TObject);
begin
  GlobalEventBus
    .Post(
      TProps
        .Create
          //.PropString(SpeedButton1.Name)
          .Key('MasterButton')
    );
  TRouter4D.Link.&To('Fornecedores');
end;

procedure TFrmViewMenu.SpeedButton3Click(Sender: TObject);
begin
  GlobalEventBus
    .Post(
      TProps
        .Create
          //.PropString(SpeedButton1.Name)
          .Key('MasterButton')
    );
  TRouter4D.Link.&To('Produtos');
end;

procedure TFrmViewMenu.SpeedButton4Click(Sender: TObject);
begin
  TRouter4D.Link.&To('Produtos');
end;

procedure TFrmViewMenu.UnRender;
begin

end;

end.
