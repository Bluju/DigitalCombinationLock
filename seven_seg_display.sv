module seven_seg_display(
input logic done, fail,
input logic [1:0] attempt, 
output logic [6:0] led0, led1, led2, led3, led4, led5
);

always @* begin


if (done) begin
	//display OPEN
	led5 = 7'h40; // O
	led4 = 7'h0C; // P
	led3 = 7'h06; // E
	led2 = 7'h48; // N
	led1 = 7'h7F; // *blank*
	led0 = 7'h7F; // *blank*
end

else if(fail) begin 
	
	//display denied
	led5 = 7'h21; // D
	led4 = 7'h06; // E
	led3 = 7'h48; // N
	led2 = 7'h79; // I
	led1 = 7'h06; // E
	led0 = 7'h21; // D
end

else begin
	//display attempts remaining
	led5 = 7'h07; // T
	led4 = 7'h2F; // R
	led3 = 7'h11; // Y
	led2 = 7'h12; // S
	led1 = 7'h37; // =
	// led1-5 is a constant
	case (attempt)
		2'b01: led0 = 7'h79; // display 1
		2'b10: led0 = 7'h24; // display 2
		2'b11: led0 = 7'h30; // display 3
		default: led0 = 7'b0000000;
		endcase 

end

end





endmodule