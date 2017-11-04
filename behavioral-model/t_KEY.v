module t_KEY();
	reg keyEnable, readKey;
	reg[31:0] keyBuffer;
	wire[31:0] keyPass;

	KEY k (keyEnable, keyPass, readKey, keyBuffer);

	initial
	begin

		$dumpfile("t_key.vcd");
		$dumpvars;
		
		keyEnable = 1;
		readKey = 1;
		//keyBuffer = 1;

		#10;
		keyEnable = 1;
		readKey = 0;
		keyBuffer = 4;

		#10;
		keyEnable = 1;
		readKey = 1;
		keyBuffer = 8;

		#10;
		keyEnable = 1;
		readKey = 0;
		keyBuffer = 16;

		#10;
		keyEnable = 1;
		readKey = 0;
		keyBuffer = 32;

		#10;
		keyEnable = 1;
		readKey = 1;
		keyBuffer = 64;
	end
	
	always @(*)
		$display("keyEnable = %b \treadKey = %b \tkeyBuffer = %32b \tkeyPass = %32b", keyEnable, readKey, keyBuffer, keyPass);
endmodule