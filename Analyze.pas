unit Analyze;

interface
type
  tm = array of array[1..2] of ShortInt;
  sm = array of array of ShortInt;
function move_calc(arr: tm): sm;
implementation

function move_calc(arr: tm): sm;
var
  n, i, j, x, y, ind: Integer;
  row, sum, k:byte;
begin
  n := Length(arr);
  SetLength(Result, n, n * 2 + 1);
  for i:= 0 to n - 1 do
    for j := 0 to n * 2 do
      Result[i, j] := 0;
  i := 0;
  row:=1;
  while i < n do
  begin

    if  arr[i,2] = 0 then
      if arr[i,1] = 0 then
        begin
          Inc(i);
          Continue;
        end
        else row := 0;
    ind :=  arr[i,row+1]-1;
    Result[ind,0]:= (-1 + 2*row)*(i+1);
    //right
    j:=i+1;
    sum := n+2;
    k:=0;
    while j < n do
      begin
        if arr[j,2] > 0 then
          Break;
        if arr[j,1] > 0 then
          begin
          Result[ind,n+1 + j] := sum - (1 - row);
          if row = 0 then k:=1;
          end
        else
          if row = 1 then
            Result[ind,2]:= sum -1
          else
            Result[ind,1]:= sum - k;
          Dec(sum);
          Inc(j);
      end;
    //left
    j:=i-1;
    sum := n+2;
    k:=0;
    while j >= 0 do
      begin
        if arr[j,2] > 0 then
          Break;
        if arr[j,1] > 0 then
          begin
          Result[ind,n+1 + j] := sum - (1 - row);
          if row = 0 then k:=1;
          end
        else
          if row = 1 then
            Result[ind,2]:= sum -1
          else
            Result[ind,1]:= sum - k;
          Dec(sum);
          dec(j);
      end;

    row := 1;
    inc(i);
  end;
end;
procedure position_calc();



function deep_analyze(arr:tm):string;
var intel:sm;
begin
intel:= move_calc(arr);
end;
end.

