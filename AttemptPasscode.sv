module AttemptPasscode;

initial begin
	bit [7:0] passcode = 8'b11111001;
    
	$display("Passcode entered: %0d", calcPasscode(passcode));
end

function int calcPasscode(bit [7:0] X);
    int res = 10;
    if (X[7]) begin
        res = res + 128;
		  $display("X[7]");
	 end
    if (X[6]) begin
        res = res + 64;
		  $display("X[6]");
    end
    if (X[5])
        res = res + 32;
    if (X[4])
        res = res + 16;
    if (X[3])
        res = res + 8;
    if (X[2])
        res = res + 4;
    if (X[1])
        res = res + 2;
    if (X[0])
        res = 128;
    
	 $display("result in function: %0d", res);
    return res;
endfunction

endmodule

