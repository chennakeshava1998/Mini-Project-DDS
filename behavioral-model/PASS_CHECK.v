module PASS_CHECK ( keyPass, lockPass, unlockDoor, readLock, readKey );
	
	input[31:0] keyPass;              // Previous/Original password present in the Key.
	input[31:0] lockPass;             // Previous/Original password present in the Lock.
	output reg unlockDoor;			  // unlockDoor : 1 ==> Passwords match and door must be unlocked,0 ==> Passwords donot match.
			 
	output reg readLock;			  // Variable to decide if Password must be read or written onto Lock.
	output reg readKey;				  // Variable to decide if Password must be read or written onto Lock.

	always @(keyPass or lockPass)
	begin
			$display("Current Password in Key = %d", keyPass);
			$display("Current Password in Lock = %d", lockPass);
			if ( keyPass == lockPass )
			begin
				unlockDoor = 1'b1;
				readLock = 0;  // passwords in lock can be updated because the passwords have matched
				readKey = 0;  // passwords in lock can be updated because the passwords have matched
				$display("The passwords match! Updating the passwords...\n\n");
			end
			else
			begin
				$display("The passwords donot match!");
				unlockDoor = 0;
				readLock = 1;
				readKey = 1;
			end
	end
	
endmodule