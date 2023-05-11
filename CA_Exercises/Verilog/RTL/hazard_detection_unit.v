module hazard_detection_unit(
    input mem_read_ID_EX,
    input[4:0] RegisterRs1_IF_ID, RegisterRs2_IF_ID, RegisterRd_ID_EX,
    output reg stall
    );

    always @(mem_read_ID_EX, RegisterRs1_IF_ID, RegisterRs2_IF_ID, RegisterRd_ID_EX)
	begin
	  if((mem_read_ID_EX == 1) && ((RegisterRd_ID_EX == RegisterRs1_IF_ID)||(RegisterRd_ID_EX == RegisterRs2_IF_ID)))
	      stall = 1;
	  else
	      stall = 0;
	end

endmodule
