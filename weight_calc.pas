unit weight_calc;

uses analyze;

interface

function weight(const ind_loc: byte; mas: tm): tm;

implementation

function weight(const ind_loc: byte; mas: tm): tm;
var
  indcube,i, n: byte;
begin
  //
  n := Length(mas);
  SetLength(result, n);
  indcube := mas[ind_loc, 1];
  for i := 0 to n - 1 do
    if i <> ind_loc then
    begin
      if mas[i, 1] = 0 then
        result[i, 1] := n + 1 - ind_loc;
      if mas[i, 2] = 0 then
        result[i, 2] := n + 1 - ind_loc + 1
    end;
end;

end.
