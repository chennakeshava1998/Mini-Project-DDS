module t_RPG();
	wire[31:0] newPass;
	reg unlockDoor, keyEnable;
	integer i;
	RPG p ( newPass, unlockDoor, keyEnable );

	initial
	begin
		$dumpfile("t_RPG.vcd");
		$dumpvars;

		keyEnable = 1;
		unlockDoor = 1;
		
		#400 $finish;
		
	end

	initial 
	begin
		for(i = 0;i < 31; i = i + 1)
		begin
			#20 keyEnable = ~keyEnable;
			#40 unlockDoor = ~unlockDoor;
		end
	end

	always @(*)
		$display("keyEnable = %d \tunlockDoor = %d \tnewPass = %d", keyEnable, unlockDoor, newPass);

endmodule