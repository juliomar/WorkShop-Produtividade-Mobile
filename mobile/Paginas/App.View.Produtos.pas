unit App.View.Produtos;

interface

uses
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.ListBox,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Types,

  Router4D,
  Router4D.Interfaces,
  Router4D.Props,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TFrmProdutos = class(TForm, iRouter4DComponent)
    LytGeral: TLayout;
    Rectangle3: TRectangle;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Path1: TPath;
    Layout2: TLayout;
    ListBoxItem2: TListBoxItem;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Path2: TPath;
    Layout4: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ListBoxItem3: TListBoxItem;
    Rectangle4: TRectangle;
    Layout5: TLayout;
    Path3: TPath;
    Layout6: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ListBoxItem4: TListBoxItem;
    Rectangle5: TRectangle;
    Layout7: TLayout;
    Path4: TPath;
    Layout8: TLayout;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ListBoxItem5: TListBoxItem;
    Rectangle6: TRectangle;
    Layout9: TLayout;
    Path5: TPath;
    Layout10: TLayout;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ListBoxItem6: TListBoxItem;
    Rectangle7: TRectangle;
    Layout11: TLayout;
    Path6: TPath;
    Layout12: TLayout;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lytTool: TLayout;
    Rectangle11: TRectangle;
    Label20: TLabel;
    Layout13: TLayout;
    Path7: TPath;
    SpeedButton1: TSpeedButton;
    Layout14: TLayout;
    Path8: TPath;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateRouters;
  public
    { Public declarations }
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  FrmProdutos: TFrmProdutos;

implementation

uses
  App.View.Produtos.Sub;

{$R *.fmx}

procedure TFrmProdutos.FormCreate(Sender: TObject);
begin
  CreateRouters;
end;

{ TFrmProdutos }

procedure TFrmProdutos.CreateRouters;
begin
  TRouter4D.Switch.Router('Cadastro de Produtos', TFrmCadProdutos);
end;

function TFrmProdutos.Render: TFMXObject;
begin
  Result := LytGeral;
end;

procedure TFrmProdutos.SpeedButton1Click(Sender: TObject);
begin
  GlobalEventBus
    .Post(
      TProps
        .Create
          //.PropString(SpeedButton1.Name)
          .Key('MasterButton')
    );
  //TRouter4D.Link.&To('Menu');
end;

procedure TFrmProdutos.SpeedButton2Click(Sender: TObject);
begin

  TRouter4D.Link.&To('Cadastro de Produtos');
end;

procedure TFrmProdutos.UnRender;
begin

end;

end.
