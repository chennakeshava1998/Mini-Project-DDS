module TEST ();
	reg keyEnable;			// This signal will be high for specified time, after the key is inserted.
	wire unlockDoor;		// Variable for deciding if passwords match or not.
	MAIN m ( keyEnable, unlockDoor );

	initial
	begin
		keyEnable = 1;

		repeat(20)
			#5 keyEnable = !keyEnable;
	end

	always @(keyEnable) $display("keyEnable = %b \tunlockDoor = %b", keyEnable, unlockDoor);
endmodule