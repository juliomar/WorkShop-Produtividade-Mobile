unit Controller.Pessoa;

interface

procedure Registry;


implementation

uses
  Horse,

  ADRConn.Model.Factory,
  ADRConn.Model.Interfaces,

  DAO.Pessoa,

  System.JSON,
  System.StrUtils,
  System.SysUtils,
  System.Classes;

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOPessoa;
  LConn   : IADRConnection;
  LResult : TJSONArray;
begin
  LConn   := TADRConnModelFactory.GetConnectionIniFile;
  LConn.Connect;
  LDAO    := TADRConnDAOPessoa.Create(LConn);
  try
    LResult := LDAO.List;
    if LResult.Count > 0 then
      Res
        .Send<TJSONArray>(LResult)
        .Status(THTTPStatus.Ok)
    else
      Res
        .Send<TJSONArray>(LResult)
        .Status(THTTPStatus.NotFound)
  finally
    LDAO.Free;
  end;
end;

procedure DoFind(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOPessoa;
  LConn   : IADRConnection;
  LID     : Integer;
  LResult : TJSONArray;
begin
  if not TryStrToInt(Req.Params['id'] , LID) then
    raise Exception.Create('ID inválido. Envie um número inteiro.');

  LConn := TADRConnModelFactory.GetConnectionIniFile;
  LConn.Connect;
  LDAO := TADRConnDAOPessoa.Create(LConn);
  try
    LResult := LDAO.Find(LID);
    if LResult.Count > 0 then
      Res
        .Send<TJSONArray>(LResult)
        .Status(THTTPStatus.OK)
    else
      Res
        .Send<TJSONArray>(LResult)
        .Status(THTTPStatus.NotFound);
  finally
    LDao.Free;
  end;

end;

procedure DoInsert(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOPessoa;
  LConn   : IADRConnection;
  LResult : TJSONObject;
begin
  //Testamos se recebemos um JSON no Body
  if Req.Body.IsEmpty then
    raise Exception.Create('Corpo da requisição inválido. Envie um JSONArray com os dados a serem inseridos.');

  LConn   := TADRConnModelFactory.GetConnectionIniFile;
  LConn.Connect;
  LDAO   := TADRConnDAOPessoa.Create(LConn);
  try
    LResult := LDAO.Insert(Req.Body);
    if LResult.Count > 0 then
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.Created)
    else
      Res
        .Send<TJSONObject>(
          TJSONObject.Create(
            TJSONPair.Create('Erro:', 'Registro já existe.')
          )
        )
        .Status(THTTPStatus.Conflict);
  finally
    LDao.Free;
  end;

end;

procedure DoUpdate(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOPessoa;
  LConn   : IADRConnection;
  LResult : TJSONObject;
  LID     : Integer;
begin
  if not TryStrToInt(Req.Params['id'] , LID) then
    raise Exception.Create('ID inválido. Envie um número inteiro.');

  //Testamos se recebemos um JSON no Body
  if Req.Body.IsEmpty then
    raise Exception.Create('Corpo da requisição inválido. Envie um JSONArray com os dados a serem inseridos.');

  LConn   := TADRConnModelFactory.GetConnectionIniFile;
  LConn.Connect;
  LDAO   := TADRConnDAOPessoa.Create(LConn);
  try
    LResult := LDAO.Update(LID, Req.Body);
    if LResult.Count > 0 then
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.Created)
    else
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.NoContent);
  finally
    LDao.Free;
  end;
end;

procedure DoDelete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LDAO    : TADRConnDAOPessoa;
  LConn   : IADRConnection;
  LResult : TJSONObject;
  LID     : Integer;
begin
  if not TryStrToInt(Req.Params['id'] , LID) then
    raise Exception.Create('ID inválido. Envie um número inteiro.');

  LConn   := TADRConnModelFactory.GetConnectionIniFile;
  LConn.Connect;
  LDAO   := TADRConnDAOPessoa.Create(LConn);
  try
    LResult := LDAO.Delete(LID);
    if LResult.Count > 0 then
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.Created)
    else
      Res
        .Send<TJSONObject>(LResult)
        .Status(THTTPStatus.NoContent);
  finally
    LDao.Free;
  end;

end;


procedure Registry;
begin
  THorse
    .Get   ('/pessoa'     , DoList)
    .Get   ('/pessoa/:id' , DoFind)
    .Post  ('/pessoa'     , DoInsert)
    .Put   ('/pessoa/:id' , DoUpdate)
    .Delete('/pessoa/:id' , DoDelete);
end;

end.
