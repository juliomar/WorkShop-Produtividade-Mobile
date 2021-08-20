unit App.View.Cliente.Sub;

interface

uses
  Router4D,

  FMX.DialogService,

  RESTRequest4D,

  Data.Bind.Components,
  Data.Bind.DBScope,
  Data.Bind.EngExt,
  Data.Db,

  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Edit,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Types,

  Fmx.Bind.DBEngExt,
  Fmx.Bind.Editors,

  Router4D.Interfaces,

  System.Bindings.Outputs,
  System.Classes,
  System.Rtti,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TFrmCadClientes = class(TForm, iRouter4DComponent)
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    Layout8: TLayout;
    Path1: TPath;
    SpeedButton2: TSpeedButton;
    lblID: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    Button1: TButton;
    procedure FrmCadClientesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  FrmCadClientes: TFrmCadClientes;

implementation

uses
  UntDM;

{$R *.fmx}

procedure TFrmCadClientes.Button1Click(Sender: TObject);
begin
  TDialogService.MessageDialog(
    'Confirma exclusão do registro atual?',
    TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
    TMsgDlgBtn.mbYes,
    0,
    procedure (const AModalResult : TModalResult)
    begin
      if AModalResult = mrYes then
      begin
        if DM.ExcluirCliente then
        begin
          DM.MemPessoa.Delete;
          TRouter4D.Link.&To('Clientes');
          TDialogService.ShowMessage('Excluído com sucesso.');
        end;
      end;
    end
  );
end;

procedure TFrmCadClientes.FrmCadClientesClick(Sender: TObject);
begin
  TRouter4D.Link.&To('Clientes');
end;

{ TFrmFornecedores }

function TFrmCadClientes.Render: TFMXObject;
begin
  Result := LytGeral;
end;

procedure TFrmCadClientes.SpeedButton1Click(Sender: TObject);
begin
  TRouter4D.Link.&To('Clientes');
end;

procedure TFrmCadClientes.SpeedButton2Click(Sender: TObject);
begin
  if DM.MemPessoa.State in dsEditModes then
  begin
    DM.MemPessoa.Post;
    DM.Send;
    TRouter4D.Link.&To('Clientes');
  end;
end;

procedure TFrmCadClientes.UnRender;
begin

end;

end.
