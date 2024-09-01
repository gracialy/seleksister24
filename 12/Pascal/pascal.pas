program Pascal;

{$mode objfpc}

uses SysUtils;

type
    TMatrix = array of array of Double;

function ReadInput(filename: string): TMatrix;
var
    f: TextFile;
    i, j, n: Integer;
    matrix: TMatrix;
begin
    Assign(f, filename);
    Reset(f);
    ReadLn(f, n);
    SetLength(matrix, n, n);
    for i := 0 to n - 1 do
    begin
        for j := 0 to n - 1 do
        begin
            Read(f, matrix[i, j]);
        end;
        ReadLn(f); // to move to the next line after reading a row
    end;
    Close(f);
    Result := matrix;
end;

procedure PrintMatrix(matrix: TMatrix);
var
    i, j: Integer;
begin
    for i := 0 to Length(matrix) - 1 do
    begin
        for j := 0 to Length(matrix[i]) - 1 do
        begin
            Write(matrix[i, j]:0:2, ' ');
        end;
        WriteLn;
    end;
end;

procedure WriteOutput(matrix: TMatrix; output_file: string);
var
    f: TextFile;
    i, j: Integer;
begin
    Assign(f, output_file);
    Rewrite(f);
    WriteLn(f, Length(matrix));
    for i := 0 to Length(matrix) - 1 do
    begin
        for j := 0 to Length(matrix[i]) - 1 do
        begin
            Write(f, matrix[i, j]:0:2, ' ');
        end;
        WriteLn(f);
    end;
    Close(f);
end;

function InverseGaussJordan(matrix: TMatrix): TMatrix;
var
    n, i, j, k: Integer;
    temp, max_val, temp_val: Double;
    max_row: LongWord;
    inverse: TMatrix;
begin
    n := Length(matrix);
    SetLength(inverse, n, n);
    
    // Initialize the inverse matrix as the identity matrix
    for i := 0 to n - 1 do
    begin
        for j := 0 to n - 1 do
        begin
            if i = j then
                inverse[i, j] := 1
            else
                inverse[i, j] := 0;
        end;
    end;

    // Perform the Gauss-Jordan elimination
    for i := 0 to n - 1 do
    begin
        // Find the maximum element in the current column
        max_val := matrix[i, i];
        max_row := i;
        for j := i + 1 to n - 1 do
        begin
            if Abs(matrix[j, i]) > Abs(max_val) then
            begin
                max_val := matrix[j, i];
                max_row := j;
            end;
        end;

        // Swap the current row with the row containing the maximum element
        if max_row <> i then
        begin
            for j := 0 to n - 1 do
            begin
                temp := matrix[i, j];
                matrix[i, j] := matrix[max_row, j];
                matrix[max_row, j] := temp;

                temp := inverse[i, j];
                inverse[i, j] := inverse[max_row, j];
                inverse[max_row, j] := temp;
            end;
        end;

        // Normalize the current row
        temp_val := 1 / matrix[i, i];
        for j := 0 to n - 1 do
        begin
            matrix[i, j] := matrix[i, j] * temp_val;
            inverse[i, j] := inverse[i, j] * temp_val;
        end;

        // Eliminate the current column in all other rows
        for j := 0 to n - 1 do
        begin
            if j <> i then
            begin
                temp_val := matrix[j, i];
                for k := 0 to n - 1 do
                begin
                    matrix[j, k] := matrix[j, k] - matrix[i, k] * temp_val;
                    inverse[j, k] := inverse[j, k] - inverse[i, k] * temp_val;
                end;
            end;
        end;
    end;

    Result := inverse;
end;

var
    matrix: TMatrix;
    inverse: TMatrix;
    input_file: string;
    output_file: string;

begin
    input_file := 'input.txt';
    output_file := 'output/pascal.txt';

    matrix := ReadInput(input_file);
    inverse := InverseGaussJordan(matrix);
    WriteOutput(inverse, output_file);
end.
