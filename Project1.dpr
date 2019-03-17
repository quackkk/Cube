program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Analyze;

const
  hos = 1000;
type
  //tm = array of array [1..2] of ShortInt;
  //sm = array of array of ShortInt;
  bm = array of Boolean;
  log_record = record
  ms:tm;
  move_list:string;
  ind_move:Byte;
  ind_cube:Byte;
  sum_weight:Word;
  end;
  var
    log_rec:array of log_record;
    n:Byte;
    i,j:integer;
    solve_arr:bm;


begin
  while True do
  begin
    Write('INPUT size of cube arr: ');
    Readln(n);
    SetLength(log_rec,hos);
    SetLength(solve_arr, n + 2);
    for i:=1 to n do
      solve_arr[i]:=False;
    solve_arr[0]:=True;
    solve_arr[n+1]:= True;
    for i := 0 to hos-1 do
      SetLength(log_rec[i].ms,n);
    for i := 0 to n - 1 do
      readln(log_rec[0].ms[i,1]);
    j:=0;
    move_calc(log_rec[0].ms);
    while j >= 0 do
      begin
      if Length(log_rec[j].move_list) = 0 then
        begin
          Dec(j);
          Continue;
        end;




      end;



    Readln;
  end;

end.
