module ComboLock(
input logic en, 
input logic [1:0] attempts,
input logic [5:0] passcode,
output logic [6:0] led0, led1, led2, led3, led4, led5);

//assign initial values to outputs

//Tasks for setting the display
task setDisplayClosed;
	begin
		led5 = 7'h46;
		led4 = 7'h47;
		led3 = 7'h40;
		led2 = 7'h12;
		led1 = 7'h06;
		led0 = 7'h21;
	end
endtask
task setDisplayTrysRemaining;
	begin 
		led5 = 7'h07;
		led4 = 7'h2F;
		led3 = 7'h11;
		led2 = 7'h12;
		led1 = 7'h67;
		led0 = 7'h7F;
	end
endtask
task setDisplayOpen;
	begin
		led5 = 7'h40;
		led4 = 7'h0C;
		led3 = 7'h06;
		led2 = 7'h48;
		led1 = 7'h7F;
		led0 = 7'h7F;
	end
endtask
task setDisplayDenied;
	begin
		led5 = 7'h21;
		led4 = 7'h06;
		led3 = 7'h48;
		led2 = 7'h79;
		led1 = 7'h06;
		led0 = 7'h21;
	end
endtask


always_comb begin
	passcode = 6'b101001;
	attempts = 2'b11;
	if(en == 1'b1) begin
		setDisplayTrysRemaining();
		led0 = attempts;
		
		
	end
	else begin
		//display 'Closed' in 7-segment display
		setDisplayClosed();
	end
end


endmodule

