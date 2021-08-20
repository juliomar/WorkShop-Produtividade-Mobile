program AppMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntMain in 'UntMain.pas' {FrmMain},
  App.View.Cliente in 'Paginas\App.View.Cliente.pas' {FrmClientes},
  App.View.Cliente.Sub in 'Paginas\App.View.Cliente.Sub.pas' {FrmCadClientes},
  App.View.Menu in 'Paginas\App.View.Menu.pas' {FrmViewMenu},
  App.View.Fornecedores in 'Paginas\App.View.Fornecedores.pas' {FrmFornecedores},
  App.View.Fornecedores.Sub in 'Paginas\App.View.Fornecedores.Sub.pas' {FrmCadFornecedores},
  App.View.Produtos in 'Paginas\App.View.Produtos.pas' {FrmProdutos},
  App.View.Produtos.Sub in 'Paginas\App.View.Produtos.Sub.pas' {FrmCadProdutos},
  UntDM in 'services\UntDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
