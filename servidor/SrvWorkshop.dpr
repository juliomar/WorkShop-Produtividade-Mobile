program SrvWorkshop;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.Compression,
  System.SysUtils,
  Controller.Pessoa in 'controller\Controller.Pessoa.pas',
  DAO.Pessoa in 'dao\DAO.Pessoa.pas';

begin
  THorse
    .Use(Compression())
    .Use(Jhonson);

  Controller.Pessoa.Registry;

  THorse
    .Listen(
      9000,
      procedure (Horse: THorse)
      begin
        WriteLn(Format('Servidor funcionando na porta %d', [Horse.Port]));
        WriteLn('Recebendo requests');
      end
    );
end.
