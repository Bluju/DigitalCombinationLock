module ComboLock(
input logic en, submit, 
output logic [6:0] led0, led1, led2, led3, led4, led5);

//attempts and passcode may need to be changed to wire instead of input


//Tasks for setting the display
task setDisplayClosed;
	begin
		led5 = 7'h46; // C
		led4 = 7'h47; // L
		led3 = 7'h40; // O
		led2 = 7'h12; // S
		led1 = 7'h06; // E
		led0 = 7'h21; // D
	end
endtask
task setDisplayTrysRemaining;
	begin 
		led5 = 7'h07; // T
		led4 = 7'h2F; // R
		led3 = 7'h11; // Y
		led2 = 7'h12; // S
		led1 = 7'h67; // =
		led0 = 7'h7F; // *blank*
	end
endtask
task setDisplayOpen;
	begin
		led5 = 7'h40; // O
		led4 = 7'h0C; // P
		led3 = 7'h06; // E
		led2 = 7'h48; // N
		led1 = 7'h7F; // *blank*
		led0 = 7'h7F; // *blank*
	end
endtask
task setDisplayDenied;
	begin
		led5 = 7'h21; // D
		led4 = 7'h06; // E
		led3 = 7'h48; // N
		led2 = 7'h79; // I
		led1 = 7'h06; // E
		led0 = 7'h21; // D
	end
endtask


always_comb begin

	reg passcode = 6'b101001; //set the password for the lock
	reg attempts = 2'b11; //set the amount of attempts remaining to 3
	if(en == 1'b1) begin
		setDisplayTrysRemaining(); // Display is now: Trys=
		led0 = attempts; // Display is now: Trys=3
		while(submit == 1'b0) begin
			//while attempt has not been submitted
		end
		//submit switch was flipped
		//if input == passcode
		// change display to OPEN 
		//else input was wrong
		// attempts -= 1
		//if attempts == 0
		//change display to denied for 5 seconds
		//change display to 55 then countdown to 0
		attempts = 2'b11; // change attempts back to 3
		
	end
	else begin
		//display 'Closed' in 7-segment display
		setDisplayClosed(); // Display is now: Closed
	end
end


endmodule

