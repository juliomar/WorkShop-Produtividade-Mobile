unit UntMain;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.Types,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants,

  FMX.Objects,
  FMX.MultiView,

  Router4D.Props;

type
  TFrmMain = class(TForm)
    LytMain: TLayout;
    LytIndex: TLayout;
    mtvMenu: TMultiView;
    lytMenu: TLayout;
    procedure FormShow(Sender: TObject);
  private
    procedure RegisterRouters;
    procedure createSidebar;
    { Private declarations }
  public
    { Public declarations }
    [Subscribe]
    procedure Props(AValue: TProps);
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  Router4D,

  App.View.Menu,
  App.View.Cliente,
  App.View.Fornecedores,
  App.View.Produtos;

{$R *.fmx}

procedure TFrmMain.createSidebar;
begin
  TRouter4D
    .SideBar
      .MainContainer(mtvMenu)
      .LinkContainer(LytIndex)
      .FontSize(15)
      .FontColor(TAlphaColorRec.Black)
      .ItemHeigth(60)
    .RenderToListBox;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  RegisterRouters;
  TRouter4D.Render<TFrmClientes>.SetElement(LytIndex, LytIndex);
  TRouter4D.Link.&To('Menu', lytMenu);
  mtvMenu.HideMaster;
  //TRouter4D.Render<TFrmViewMenu>.SetElement(LytIndex, LytIndex);

  GlobalEventBus.RegisterSubscriber(Self);
end;

procedure TFrmMain.Props(AValue: TProps);
begin
  if AValue.Key = 'MasterButton' then
  begin
    if mtvMenu.IsShowed
    then mtvMenu.HideMaster
    else mtvMenu.ShowMaster;
  end;
end;

procedure TFrmMain.RegisterRouters;
begin
  TRouter4D.Switch.Router('Menu', TFrmViewMenu);
  TRouter4D.Switch.Router('Clientes', TFrmClientes);
  TRouter4D.Switch.Router('Fornecedores', TFrmFornecedores);
  TRouter4D.Switch.Router('Produtos', TFrmProdutos);
end;

end.
