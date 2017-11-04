module RPG ( newPass, unlockDoor, keyEnable );
	output reg[31:0] newPass;
	input keyEnable, unlockDoor; // keyEnable here is the effective enable, which gets turned off after certain time
	
	always @(keyEnable) // this should happen only when keyEnable changes
	begin
		if(unlockDoor == 1 & keyEnable == 1)
		begin
			newPass = $random;
			$display("Passwords have been updated.");
		end
	end
	
endmodule