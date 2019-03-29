unit Analyze;

interface
type
  tm = array of array[1..2] of ShortInt;
  sm = array of array of ShortInt;
function move_calc(arr: tm): sm;
function PACS(mas: sm): string;
function CSCA(var s: string; n: Integer):tm;
implementation

function move_calc(arr: tm): sm;
var
  n, i, j, x, y, ind: Integer;
  row, sum, k:byte;
begin
  n := Length(arr)-1;
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
        else
        if ((i > (arr[n,1]-1)) and (i < (n - arr[n,2]))) then row := 0
        else Continue;
    ind :=  arr[i,row+1]-1;
    Result[ind,0]:= row * n + i;  ////
    //right
    j:=i+1;
    sum := n+1;
    k:=0;
    while j < n do
      begin
        if arr[j,2] > 0 then
          Break;
        if arr[j,1] > 0 then
          begin
          Result[ind,n+1 + j] := sum - (1 - row); ////
          if row = 0 then k:=1;
          end
        else
          if row = 1 then
            Result[ind, n + j]:= sum -1  ////
          else
            Result[ind, j]:= sum - k; ////
          Dec(sum);
          Inc(j);
      end;
    //left
    j:=i-1;
    sum := n+1;
    k:=0;
    while j >= 0 do
      begin
        if arr[j,2] > 0 then
          Break;
        if arr[j,1] > 0 then
          begin
          Result[ind,n+1 + j] := sum - (1 - row);////
          if row = 0 then k:=1;
          end
        else
          if row = 1 then
            Result[ind,n + j]:= sum -1 //
          else
            Result[ind,j]:= sum - k; //
          Dec(sum);
          dec(j);
      end;

    row := 1;
    inc(i);
  end;
end;
{procedure position_calc(beg_arr:tm;res_arr:sm);
var
  n,i,j:Byte;
begin
  n:=Length(res_arr);
for i:=0 to n-1 do
  if res_arr[beg_arr[i,1]-1,0] > 0 then
    begin
      if i  <
    end;
end;     }



function deep_analyze(arr:tm):string;
var intel:sm;
begin
intel:= move_calc(arr);
end;

function PACS(mas: sm): string;// priority array to coordinate string
var S: string;
i,j,k,n,max:Integer;
begin
    S:='';
    n:= Length(mas);
    //find max
    max:= 0;
    for i:= 0 to n-1 do
        for j:= 1 to 2*n do
            if mas[i,j] > max then
                max:=mas[i,j];
    //create a result string
    for k:= max downto 1 do
    begin
        for i:= 0 to n-1 do
            for j:= 1 to 2*n do
                if mas[i,j] = k then
                begin
                    if j div (n+1) = 0 then
                        S:= 'a'+ inttostr(j) + S
                    else
                        s:= 'b' + inttostr(j-n) + S;

                    if mas[i,0] div (n+1) = 0 then
                        S:= 'a'+ inttostr(mas[i,0]) + S
                     else
                        s:= 'b' + inttostr(mas[i,0]-n) + S;
                end;
    end;
    Result:= s;
end;

function CSCA(var s: string; n: integer): tm;//coordinate string to coordinate array
var l: Integer;
begin
    SetLength(Result,1);
    l:= Length(s);
    if s[l-3]= 'a' then
        Result[0,1]:= StrToInt(s[l-2])
    else
        Result[0,1]:= n + Strtoint(s[l-2]);
    if s[l-1]= 'a' then
        Result[0,2]:= StrToInt(s[l])
    else
        Result[0,2]:= n + Strtoint(s[l]);
    SetLength(s,l-4);
end;

end.

