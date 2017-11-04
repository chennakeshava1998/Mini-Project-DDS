module LOCK ( lockPass, readLock, lockBuffer);
	

	input readLock;            // signal to check if password is to be read or overwritten
	
	input[31:0] lockBuffer;    // used to only write the new password into the lockPass register
	integer i;
	output reg[31:0] lockPass; // Previous/Original password present in the Lock.

	initial
	begin
		for(i = 0;i < 32;i = i + 1)
			lockPass[i] <= 0;
	end


	always @( lockBuffer )
	begin	
		if (readLock == 0)
		begin
			// updating the new password in the lock
			for(i = 0;i < 32;i = i + 1)
				lockPass[i] <= lockBuffer[i];
		end
	end

endmodule
