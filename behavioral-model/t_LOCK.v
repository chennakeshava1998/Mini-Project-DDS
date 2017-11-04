module t_LOCK();
	reg lockEnable, readLock;
	reg[31:0] lockBuffer;
	wire[31:0] lockPass;

	LOCK l ( lockPass, readLock, lockBuffer);

	initial
	begin

		$dumpfile("t_lock.vcd");
		$dumpvars;
		
		
		readLock = 1;
		lockBuffer = 1;

		#10;
		
		readLock = 0;
		lockBuffer = 4;

		#10;
		
		readLock = 1;
		lockBuffer = 8;

		#10;
		
		readLock = 0;
		lockBuffer = 16;

		#10;
		
		readLock = 0;
		lockBuffer = 32;

		#10;
		
		readLock = 1;
		lockBuffer = 64;

		$finish;
	end
	
	always @(*)
		$display("readLock = %b \tlockBuffer = %32b \tlockPass = %32b", readLock, lockBuffer, lockPass);
endmodule