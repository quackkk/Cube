unit Service_SerGo; //not Mit'ay

interface

uses
  analyze, sysutils;

type
  tfu = function(const p: byte; const cubes: tm): tm;

function generation(const n: shortint): tm;

procedure print_tm(const pm: tm);

function AssertEqual_ser(loc_i: Byte; Farr: tm; solve: tm; fun: tfu): Boolean;

procedure out_cubes(nameout: string; K, n: word; F: boolean = False; rand: boolean = true);

implementation

function AssertEqual_ser(loc_i: Byte; Farr: tm; solve: tm; fun: tfu): Boolean;
var
  i, j: ShortInt;
  aft: tm;
  l1, l2, k: Byte;
begin
  aft := fun(loc_i, Farr);
  ///

  ///
end;

procedure print_tm(const pm: tm);
var
  i, n: integer;
begin
  n := length(pm);
  writeln(n);
  for i := 0 to n - 1 do
    write(pm[i, 2]: 3);
  writeln;
  for i := 0 to n - 1 do
    write(pm[i, 1]: 3);
  writeln(#10);
end;

procedure out_cubes(nameout: string; K, n: word; F: boolean = False; rand: boolean = true);
{F=false - append file, true - rewrite
K - quantity of array
n >> (*
     Rand = true - random variable from 3 to N
     Rand = false - const = N
     *)
}

var
  i: integer;
  fi: textfile;

  procedure print__tm(const pm: tm);
  var
    i, n: integer;
  begin
    n := length(pm);
    writeln(fi,n);
    for i := 0 to n - 1 do
      write(fi,pm[i, 2]: 3);
    writeln(fi);
    for i := 0 to n - 1 do
      write(fi,pm[i, 1]: 3);
    writeln(fi,#10);
  end;

begin
  assignfile(fi, nameout);
  if F or not FileExists(nameout) then
    rewrite(fi)
  else
    append(fi);
    writeln(fi,K);
  for i := 1 to K do
    if rand then
      print__tm(generation(random(n - 2) + 3))
    else
      print__tm(generation(n));
  closefile(fi);
end;

function generation(const n: shortint): tm;
var
  i, x, l, m, j: shortint;
  masss: tm;
begin
  setlength(result, n);
  setlength(masss, n);
  for i := 0 to n - 1 do
  begin
    masss[i, 1] := i + 1;
    result[i, 1] := 0;
    result[i, 2] := 0;
  end;
  l := random(3);
  if l > n shr 1 then
  begin
    l := n shr 1;
  end;
  // k := random(2) * (n - 1);
  if n > 1 then
    for i := 0 to n - 1 do
    begin
   { repeat
      m := random(n);
    until result[m, 1] = 0; }
    //j := abs(k - i);
      repeat
        x := random(n);
        if (i = n - 1) and (x = n - 1) then
        begin
          result := generation(n);
          exit;
        end;
      until (x <> i) and (masss[x, 1] > 0);
      result[i, 1] := x + 1;
      masss[x, 1] := 0;
    end;
 // if l=2 then

  for i := 1 to l do
  begin
      {repeat
        m := random(n);
      until (result[m, 1] > 0) and (result[m, 2] = 0);
      repeat
        x := random(n);
      until (masss[x, 1] > 0);
      result[m, 2] := x + 1;
      masss[x, 1] := 0;
      ///#1 method generation (*don't use*)   }
    repeat
      m := random(n);
    until (result[m, 1] > 0) and (result[m, 2] = 0);
    x := result[m, 1];
    result[m, 1] := 0;
    repeat
      m := random(n);
    until (result[m, 1] > 0) and (result[m, 2] = 0);
    result[m, 2] := x;

  end;

end;

end.
 
