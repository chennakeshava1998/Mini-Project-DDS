module KEY ( keyEnable, keyPass, readKey, keyBuffer);
	
	input keyEnable, // signal to enable the circuits in the key (used to ensure only one iteration happens)
		  readKey; // signal to check if password is to be read or overwritten
	
	input[31:0] keyBuffer; // used to only write the new password into the keyPass register
	integer i;
	output reg[31:0] keyPass;

/*
	if(keyEnable == 0)
	begin
		$finish;
	end
*/


	initial
	begin
		for(i = 0;i < 32;i = i + 1)
			keyPass[i] <= 0;
	end


	always @(keyBuffer)
	begin	
		if(readKey == 0)
		begin
			// updating the new password in the key
			for(i = 0;i < 32;i = i + 1)
			begin
				keyPass[i] <= keyBuffer[i];
			end
		end
	end

endmodule
