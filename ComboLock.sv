module combolock(
input logic submit, rst,
input logic [7:0]passcode_attempt, 
output logic [6:0] led0, led1, led2, led3, led4, led5
);

logic good, fail;

logic [1:0] attempt;

logic [7:0] passcode, check;

assign passcode = 8'b01001001;

seven_seg_display display(
.done(good),
.fail(fail),
.attempt(attempt), 
.led0(led0),
.led1(led1), 
.led2(led2),
.led3(led3),
.led4(led4),
.led5(led5)
);


assign check = passcode ^ passcode_attempt;

always @(posedge submit, negedge rst) begin

if(~rst) begin
	attempt <= 2'b11;
	good <= 1'b0;
	fail <= 1'b0;
end
else begin
	if(check == 8'b0) begin
		good <= 1'b1;
		attempt <= 2'b00;
	end
	else if (attempt > 2'b01) begin
		attempt <= attempt - 2'b01;
		good <= 1'b0;
	end
	else begin
		fail <= 1'b1;
	end

end

end 
endmodule 
