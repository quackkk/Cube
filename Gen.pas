unit Gen;

interface
type
  tm = array of array[1..2] of ShortInt;
procedure Swap(var a, b: ShortInt);
function Rgen(n: ShortInt): tm;
implementation

procedure Swap(var a, b: ShortInt);
var
  p: ShortInt;
begin
  p := a;
  a := b;
  b := p;
end;

function Rgen(n: ShortInt): tm;
var
  i, p, rc, rp, rn, lp: ShortInt;
begin
  Randomize;
  SetLength(Result, n + 1);
  for i := 0 to n - 1 do
    Result[i, 1] := i + 1;
  for i := n - 1 downto 1 do
    Swap(Result[Random(i + 1), 1], Result[i, 1]); //тасование
  if n > 3 then
    p := Random(3)
  else
    p := Random(2);
  for i := 1 to p do //перестановка 0-2 кубиков наверх
  begin
    lp := n - i + 1;
    rc := Random(lp);
    while True do
      if (Result[rc, 2] = 0) and (Result[rc, 1] <> 0) then
      begin
        rp := Result[rc, 1];
        Result[rc, 1] := 0;
        Break;
      end
      else
        rc := Random(lp);
    rn := Random(lp - 1);
    while True do
      if (Result[rn, 2] = 0) and (Result[rn, 1] <> 0) then
      begin
        Result[rn, 2] := rp;
        Break;
      end
      else
        rn := Random(lp - 1);
  end;
  for i := 0 to n - 1 do //подсчёт подряд стоящих кубиков
    if Result[i, 1] = i + 1 then
      Inc(Result[n, 1])
    else
      Break;
  for i := n - 1 downto 0 do
    if Result[i, 1] = i + 1 then
      Inc(Result[n, 2])
    else
      Break;
end;
end.

