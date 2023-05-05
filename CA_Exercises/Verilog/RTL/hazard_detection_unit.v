module hazard_detection_unit(mem_read_ID_EX, IF_IDRegisterRs1, IF_IDRegisterRs2, ID_EXRegisterRd, stall);

input mem_read_ID_EX;
input[4:0] IF_IDRegisterRs1, IF_IDRegisterRs2, ID_EXRegisterRd;
output reg stall;

always @(mem_read_ID_EX, IF_IDRegisterRs1, IF_IDRegisterRs2, ID_EXRegisterRd)
	begin
	  if((mem_read_ID_EX == 1) && ((ID_EXRegisterRd ==IF_IDRegisterRs1)||(ID_EXRegisterRd ==IF_IDRegisterRs2)))
	    begin
	      stall = 1;
	    end
	  else
	    begin
	      stall = 0;
	    end
	end

endmodule