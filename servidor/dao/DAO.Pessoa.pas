unit DAO.Pessoa;

interface

uses
  ADRConn.DAO.Base,
  ADRConn.Model.Factory,
  ADRConn.Model.Interfaces,

  Dataset.Serialize,
  Data.Db,

  System.JSON,
  System.Classes,
  System.SysUtils,
  System.StrUtils;

type
  TADRConnDAOPessoa = class(TADRConnDAOBase)
    private

    public
      function List(): TJSONArray;
      function Find(const AID: Integer): TJSONArray;
      function Insert(const AValue: string): TJSONObject;
      function Update(const AID: Integer; const AValue: string): TJSONObject;
      function Delete(const AID: Integer): TJSONObject;
  end;

implementation

{ TADRConnDAOPessoa }

function TADRConnDAOPessoa.List: TJSONArray;
var
  LDataSet: TDataSet;
begin
  try
    LDataSet :=
      FQuery
        .SQL('SELECT * FROM TB_PESSOA ORDER BY PES_ID')
        .Open();
    if LDataSet.IsEmpty then
      Result := TJSONArray.Create
    else
      Result := LDataSet.ToJSONArray;
  finally
    LDataSet.Free;
  end;
end;

function TADRConnDAOPessoa.Find(const AID: Integer): TJSONArray;
var
  LDataSet : TDataSet;
begin
  try
    LDataSet :=
      FQuery
        .SQL('SELECT * FROM TB_PESSOA WHERE PES_ID = :pPES_ID')
        .ParamAsInteger('pPES_ID', AID)
        .Open();

    if LDataSet.IsEmpty then
      Result := TJSONArray.Create
    else
      Result := LDataSet.ToJSONArray;
  finally
    LDataSet.Free;
  end;
end;

function TADRConnDAOPessoa.Insert(const AValue: string): TJSONObject;
var
  LDataSet : TDataSet;
begin
  try
    try
      LDataSet :=
        FQuery
          .SQL('SELECT * FROM TB_PESSOA WHERE 1 <> 1')
          .Open();

      LDataSet
        .LoadFromJSON(AValue);

      Result := LDataSet.ToJSONObject;
    except on E:Exception do
      begin
        Result := TJSONObject.Create;
      end;
    end;
  finally
    LDataSet.Free;
  end;
end;

function TADRConnDAOPessoa.Update(const AID: Integer; const AValue: string): TJSONObject;
var
  LDataSet : TDataSet;
begin
  try
    try
      LDataSet :=
        FQuery
          .SQL('SELECT * FROM TB_PESSOA WHERE PES_ID = :pPES_ID')
          .ParamAsInteger('pPES_ID', AID)
          .Open();

      LDataSet
        .MergeFromJSONObject(AValue);

      Result := LDataSet.ToJSONObject;
    except on E:Exception do
      begin
        Result := TJSONObject.Create;
      end;
    end;
  finally
    LDataSet.Free;
  end;
end;

function TADRConnDAOPessoa.Delete(const AID: Integer): TJSONObject;
var
  LDataSet : TDataSet;
begin
  try
    try
      LDataSet :=
        FQuery
          .SQL('SELECT * FROM TB_PESSOA WHERE PES_ID = :pPES_ID')
          .ParamAsInteger('pPES_ID', AID)
          .Open();

      LDataSet
        .Delete;

      Result := LDataSet.ToJSONObject;
    except on E:Exception do
      begin
        Result := TJSONObject.Create;
      end;
    end;
  finally
    LDataSet.Free;
  end;
end;

end.
