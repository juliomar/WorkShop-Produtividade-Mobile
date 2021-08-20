unit App.View.Cliente;

interface

uses
  CustomThread,
  Loading,
  Router4D,

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

  Router4D.Interfaces,
  Router4D.Props,

  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TFrmClientes = class(TForm, iRouter4DComponent)
    LytGeral: TLayout;
    Rectangle3: TRectangle;
    lstListaClientes: TListBox;
    lstItemBase: TListBoxItem;
    lytFoto: TLayout;
    lytBaseLabel: TLayout;
    pthFoto: TPath;
    recFundoBase: TRectangle;
    lytTool: TLayout;
    Rectangle11: TRectangle;
    Label20: TLabel;
    Layout13: TLayout;
    Path7: TPath;
    SpeedButton1: TSpeedButton;
    Layout14: TLayout;
    Path8: TPath;
    SpeedButton2: TSpeedButton;
    lblFantasia: TLabel;
    lblRazao: TLabel;
    lytBtnItemBase: TLayout;
    Layout1: TLayout;
    Path1: TPath;
    SpeedButton3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateRouters;
    procedure LimparLista;
    procedure OnSelecionarCliente(Sender: TObject);
  public
    { Public declarations }
    function Render : TFMXObject;
    function MasterButton : TFMXObject;
    procedure UnRender;
    procedure AbrirClientes(Sender: TObject);
  end;

var
  FrmClientes: TFrmClientes;

implementation

uses
  UntDM,

  App.View.Cliente.Sub;

{$R *.fmx}

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  CreateRouters;

  LimparLista;
  lstItemBase.Visible := False;

  AbrirClientes(Sender);
end;

function TFrmClientes.MasterButton: TFMXObject;
begin
  Result := SpeedButton1;
end;

procedure TFrmClientes.AbrirClientes(Sender: TObject);
var
  LThread : TThread;
  LFrame  : TListBoxItem;
begin
  TLoading.Show('Carregando...');

  LimparLista;

  lstListaClientes.BeginUpdate;

  lstListaClientes.Visible := False;
  lstItemBase.Visible      := False;

  DM.ListarClientes;
  if not DM.MemPessoa.IsEmpty then
  begin
    DM.MemPessoa.First;
    while not DM.MemPessoa.Eof do
    begin
      lblFantasia.Text := DM.MemPessoaPES_FANTASIA.AsString;
      lblRazao.Text    := DM.MemPessoaPES_RAZAOSOCIAL.AsString;
      LFrame           := TListBoxItem(lstItemBase.Clone(lstListaClientes));
      LFrame.Parent    := lstListaClientes;
      LFrame.Visible   := True;

      for var I : Integer := 0 to Pred(LFrame.ControlsCount) do
      begin
        if (LFrame.Controls[I] is TLayout) then
        begin
          TLayout(LFrame.Controls[I]).OnClick := OnSelecionarCliente;
          TLayout(LFrame.Controls[I]).Tag     := DM.MemPessoaPES_ID.AsInteger;
        end;
      end;

      DM.MemPessoa.Next;
    end;
  end;

  lstListaClientes.Visible := True;

  TThread.Synchronize(
    TThread.CurrentThread,
    procedure ()
    begin
      TLoading.Hide(Self);
    end
  );

  lstListaClientes.ScrollTo(0, 0);
  lstListaClientes.EndUpdate;

  TLoading.Hide(Self);
end;

procedure TFrmClientes.Button1Click(Sender: TObject);
begin
  TRouter4D.Link.&To('Cadastro de Clientes');
end;

procedure TFrmClientes.CreateRouters;
begin
  TRouter4D.Switch.Router('Cadastro de Clientes', TFrmCadClientes);
end;

{ TFrmCliente }

function TFrmClientes.Render: TFMXObject;
begin
  Result := LytGeral;
end;

procedure TFrmClientes.SpeedButton1Click(Sender: TObject);
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

procedure TFrmClientes.SpeedButton2Click(Sender: TObject);
begin
  DM.MemPessoa.Append;
  DM.MemPessoaPES_ID.AsInteger := -1;
  TRouter4D.Link.&To('Cadastro de Clientes');
end;

procedure TFrmClientes.SpeedButton3Click(Sender: TObject);
begin
  AbrirClientes(Sender);
end;

procedure TFrmClientes.UnRender;
begin

end;

procedure TFrmClientes.LimparLista;
begin
  lstListaClientes.BeginUpdate;
  lstListaClientes.Content.DeleteChildren;
  lstListaClientes.EndUpdate;
end;

procedure TFrmClientes.OnSelecionarCliente(Sender: TObject);
begin
  var LID : Integer := TLayout(Sender).Tag;
  DM.MemPessoa.Locate('PES_ID', LID, []);
  DM.MemPessoa.Edit;
  TRouter4D.Link.&To('Cadastro de Clientes');
end;

end.
