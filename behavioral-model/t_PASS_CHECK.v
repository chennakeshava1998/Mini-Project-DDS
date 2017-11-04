module t_PASS_CHECK();
	reg[31:0] keyPass;
	reg[31:0] lockPass;
	wire unlockDoor, readLock, readKey;

	PASS_CHECK p ( keyPass, lockPass, unlockDoor, readLock, readKey );

	initial
	begin
		$dumpfile("t_PASS_CHECK.vcd");
		$dumpvars;

		keyPass = 20;
		lockPass = 45;

		#10;
		keyPass = 40;
		lockPass = 40;

		#10;
		keyPass = 40;
		lockPass = 70;

		#10;
		keyPass = 10;
		lockPass = 40;

		#10;
		keyPass = 040;
		lockPass = 100;

		#10;
		keyPass = 400;
		lockPass = 400;

		#10 $finish;

	end

	always @(*)
		$display("keyPass = %d \tlockPass = %d \tunlockDoor = %b \treadLock = %b \treadKey = %b", keyPass, lockPass, unlockDoor, readLock, readKey );

endmodule