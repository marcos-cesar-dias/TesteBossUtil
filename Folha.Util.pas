unit Folha.Util;

interface

Type
  TExecuteFunc<T> = reference to function(): T;

  Util = class
    class function IfThen<T>(ACondicao: Boolean; AThen, AElse: T): T;
    class function CountElementsEnum<T: record >: Integer;

    class function ExecuteFunc<T>(AFunc: TExecuteFunc<T>): T;
  end;

implementation

uses
  TypInfo;

{ Util }

class function Util.CountElementsEnum<T>: Integer;
var
  vTypeInfo: PTypeInfo;
  vTypeData: PTypeData;
begin
  vTypeInfo := TypeInfo(T);
  vTypeData := GetTypeData(vTypeInfo);

  Result := vTypeData.MaxValue + 1;
end;

class function Util.ExecuteFunc<T>(AFunc: TExecuteFunc<T>): T;
begin
  if Assigned(AFunc) then
    result := Afunc();
end;

class function Util.IfThen<T>(ACondicao: Boolean; AThen, AElse: T): T;
begin
  if ACondicao then
    Result := AThen
  else
    Result := AElse;
end;

end.
