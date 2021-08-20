unit UntDM;

interface

uses
  RESTRequest4D,

  Data.DB,

  DataSet.Serialize,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,

  System.Classes,
  System.SysUtils;

type
  TDM = class(TDataModule)
    MemPessoa: TFDMemTable;
    MemPessoaPES_ID: TIntegerField;
    MemPessoaPES_RAZAOSOCIAL: TStringField;
    MemPessoaPES_FANTASIA: TStringField;
    MemPessoaPES_ATIVOINATIVO: TStringField;
    MemPessoaPES_CPFCNPJ: TStringField;
    MemPessoaPES_RGINSCR: TStringField;
    MemPessoaPES_FISICAJURIDICA: TStringField;
    MemPessoaPES_DTNASCIMENTO: TSQLTimeStampField;
    MemPessoaPES_DTCADASTRO: TSQLTimeStampField;
    MemPessoaPES_SITE: TStringField;
    MemPessoaPES_USUARIO_CAD: TStringField;
    MemPessoaPES_TELEFONE: TStringField;
    MemPessoaPES_CELULAR: TStringField;
    MemPessoaPES_EMAIL: TStringField;
    MemPessoaPES_COND_PAGTO_PADRAO: TIntegerField;
    MemPessoaPES_LIMITE_CREDITO: TFMTBCDField;
    MemPessoaPES_DTALTERACAO: TSQLTimeStampField;
    MemPessoaPES_DTSINCRONISMO: TSQLTimeStampField;
    MemPessoaGUID_CONTROLE: TStringField;
  private
    procedure AlterarCliente;
    procedure InserirCliente;
    { Private declarations }
  public
    { Public declarations }
    procedure ListarClientes;
    procedure Send();
    function ExcluirCliente : Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.ListarClientes;
var
  LResponse : IResponse;
begin
  try
    if MemPessoa.Active then MemPessoa.Active := False;

    LResponse :=
      TRequest.New.BaseURL('http://localhost:9000/')
      .Resource('pessoa')
      .ContentType('application/json')
      .DataSetAdapter(MemPessoa)
      .Get;

    MemPessoa.Active := True;
  finally

  end;
end;

procedure TDM.Send;
var
  LResponse: IResponse;
begin
  try
    if DM.MemPessoaPES_ID.AsInteger > 0 then
      LResponse :=
        TRequest
          .New.BaseURL('http://localhost:9000/')
          .Resource(Format('pessoa/%d', [DM.MemPessoaPES_ID.AsInteger]))
          .ContentType('applicaton/json')
          .AddBody(MemPessoa.ToJSONObject())
          .Put
    else
      LResponse :=
        TRequest
          .New.BaseURL('http://localhost:9000/')
          .Resource('pessoa')
          .ContentType('applicaton/json')
          .AddBody(MemPessoa.ToJSONObject())
          .Post;

  except on E:Exception do
    begin
      raise Exception.Create('Não foi possível gravar online.');
    end;
  end;
end;

procedure TDM.InserirCliente;
begin

end;

procedure TDM.AlterarCliente;
begin
  //
end;

function TDM.ExcluirCliente : Boolean;
var
  LResponse : IResponse;
begin
  try
    LResponse :=
      TRequest.New.BaseURL('http://localhost:9000/')
      .Resource(Format('pessoa/%d', [DM.MemPessoaPES_ID.AsInteger]))
      .Delete;

    Result := LResponse.StatusCode = 204;
  except on E:Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;


end.
