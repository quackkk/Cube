program test_priority;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  calc_priority,
  Service_SerGo,
  analyze;

var
  mass: tm;
  n, i, k: shortint;

begin
  repeat
    write('Enter N: ');
    readln(n);
    mass := generation(n);
    if mass <> nil then
    begin
      for i := 0 to n - 1 do
        write(mass[i, 2]: 3);
      writeln;
      for i := 0 to n - 1 do
        write(mass[i, 1]: 3);
      writeln
    end;
    write('Enter pos cube[0..N-1]: ');
    readln(k);
    print_tm(priority_mas_1(k,mass));
    writeln;
    print_tm(priority_mas_2(k,mass));
    writeln;
    print_tm(priority_mas_3(k,mass));
    writeln;
    assertequal_ser(k,priority_mas_1(k,mass),priority_mas_2(k,mass),priority_mas_3);
  until false;
end.
 
