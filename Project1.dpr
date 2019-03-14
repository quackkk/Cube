program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;
const
  hos = 1000;
type
  tm = array of array [1..2] of ShortInt;
  log_record = record
  ms:tm;
  move_list:string[20];
  ind_move:Byte;
  ind_cube:Byte;
  sum_weight:Word;
  end;
  var
    log_rec:array of log_record;
    n:Byte;
    i:integer;

begin
  while True do
  begin
    Write('INPUT size of cube arr: ');
    Readln(n);
    SetLength(log_rec,hos);
    for i := 0 to hos-1 do
      SetLength(log_rec[i].ms,n);



    Readln;
  end;

end.
