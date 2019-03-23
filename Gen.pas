unit Gen;

interface
type
  tm = array of array[1..2] of ShortInt;
procedure Swap(var a, b: ShortInt);
procedure Rgen(n: ShortInt; var ms: tm);
implementation

procedure Swap(var a, b: ShortInt);
var
  p: ShortInt;
begin
  p := a;
  a := b;
  b := p;
end;

procedure Rgen(n: ShortInt; var ms: tm);
var
  i, p, rc, rp, rn, lp: ShortInt;
begin
  Randomize;
  for i := n - 1 downto 1 do
    Swap(ms[Random(i + 1), 1], ms[i, 1]); //тасование
  if n > 3 then
    p := Random(3)
  else
    p := Random(2);
  for i := 1 to p do //перестановка 0-2 кубиков наверх
  begin
    lp := n - i + 1;
    rc := Random(lp);
    while True do
      if (ms[rc, 2] = 0) and (ms[rc, 1] <> 0) then
      begin
        rp := ms[rc, 1];
        ms[rc, 1] := 0;
        Break;
      end
      else
        rc := Random(lp);
    rn := Random(lp - 1);
    while True do
      if (ms[rn, 2] = 0) and (ms[rn, 1] <> 0) then
      begin
        ms[rn, 2] := rp;
        Break;
      end
      else
        rn := Random(lp - 1);
  end;
  for i := 0 to n - 1 do //подсчёт подряд стоящих кубиков
    if ms[i, 1] = i + 1 then
      Inc(ms[n, 1])
    else
      Break;
  for i := n - 1 downto 0 do
    if ms[i, 1] = i + 1 then
      Inc(ms[n, 2])
    else
      Break;
end;
end.
 
