program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  tm = array of array [1..2] of ShortInt;
  log_rec = record
    ms:TM;
  move_list:string[20];
  ind_move:Byte;
  ind_cube:Byte;
  sum_weight:Word;
  end;
  var
    n:Byte;
    
begin
  while True do
  begin
    Write('INPUT size of cube arr: ');
    Readln(n);
  end;

end.
